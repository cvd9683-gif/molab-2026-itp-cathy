# Week 08

## VideoBooth: a photo booth, but for video

[`VideoBooth`](./VideoBooth) is a tiny video version of a photo booth. You pick a short clip from your photos, and the app plays it on a loop with a funny visual effect that you can switch at any time. It's the moving-picture companion to the photo-booth idea from class.

| On screen | What it does |
| --- | --- |
| 🎞️ **Choose a clip** | pick any short video from your photo library |
| ▶️ **Player** | the clip plays and loops with the effect applied |
| 🎛️ **Effect row** | tap to switch: Original, Comic, Noir, Thermal, X-Ray, Invert |
| 🔁 **Choose another clip** | swap in a different video without leaving the screen |

### Where the idea comes from

This builds on two class examples:

- [08-FilterTheWorld](https://github.com/molab-itp/08-FilterTheWorld) runs Core Image `CIFilter`s on the live camera. VideoBooth uses the same filters, but on the frames of a chosen video instead of the camera. That's the "manipulation" part.
- [08-CameraRecorder](https://github.com/molab-itp/08-CameraRecorder) is the AVFoundation side — capturing and playing video. VideoBooth borrows the playback half (`AVPlayer` / `VideoPlayer`) and skips recording, to stay simple.

### How the code works

Five small files, in the same shape as Week06's MoodJournal:

- [`VideoBoothApp.swift`](./VideoBooth/VideoBooth/VideoBoothApp.swift) — the `@main` entry point. It just shows `BoothView`.
- [`BoothView.swift`](./VideoBooth/VideoBooth/BoothView.swift) — the one screen. Before you pick a clip it shows a `PhotosPicker` button; after, it shows a `VideoPlayer` and the row of effect buttons. The `EffectBar` here is the same idea as the `PageBar` in Week06 — one button per case of an enum, highlighted when it's the current one.
- [`BoothModel.swift`](./VideoBooth/VideoBooth/BoothModel.swift) — the single `@Observable` class, like `PageModel`/`Journal` in Week06. It holds the `AVPlayer` and the current `Effect`, loads a new clip, loops it when it reaches the end, and switches effects.
- [`Effect.swift`](./VideoBooth/VideoBooth/Effect.swift) — an enum of the effects, written just like Week06's `Mood` enum: each case looks up its own label and SF Symbol, and — the new part — the name of a Core Image filter. `.none` has no filter, so the clip plays untouched.
- [`MovieFile.swift`](./VideoBooth/VideoBooth/MovieFile.swift) — a small `Transferable` that copies the picked video into our own temporary file so it's still there after the picker closes.

**The one new concept this week** is the *video composition*. An [`AVVideoComposition`](./VideoBooth/VideoBooth/Effect.swift) is Apple's way of saying "run this code on every frame before showing it." Effect.swift builds one that hands each frame to a `CIFilter` and gives the filtered frame back. Setting `item.videoComposition` is what makes the live effect switch happen.

### Run / test it

Open `VideoBooth/VideoBooth.xcodeproj` in Xcode, pick an iPhone (simulator or your own device), and press **Cmd-R**. Then tap **Choose a clip**, pick a short video, and tap the effect buttons.

- `PhotosPicker` with `matching: .videos` runs out of process, so the app needs **no photo-library permission** and no Info.plist entries.
- The **simulator** starts with no videos in its library, so to try it there, first drag a `.mov`/`.mp4` onto the simulator window to add it to Photos, then pick it. On a real iPhone your own videos are already there.

### Known limitations

- It plays the clip with an effect but does **not save or export** a new video file — it's a viewer/booth, not an editor.
- Effects are the six parameterless Core Image filters; there are no sliders to tune them.
- Very long or very high-resolution clips may play back slowly, because the filter runs on every frame in real time.
- Only one clip at a time, and nothing is remembered after you quit.

### Attribution

Written with AI assistance (Claude Code) as a beginner-level exercise, following the structure and comment style of the earlier weeks in this repo. The effect and playback ideas come from the class examples [08-FilterTheWorld](https://github.com/molab-itp/08-FilterTheWorld) and [08-CameraRecorder](https://github.com/molab-itp/08-CameraRecorder); the code here is a fresh, simplified take rather than a copy.

> Note: this was assembled in a Linux environment without Xcode, so it has **not** been compiled, run in the simulator, or tested on a device. The code was checked by reading it against the class examples and Apple's APIs; please build and run it in Xcode to confirm.
