# Wiki 8 — Cathy

## Links

**My project:** [`VideoBooth`](./VideoBooth), pick a short video and play it on a loop with funny Core Image effects ([README](./README.md))

**Class repos:**
- [08-FilterTheWorld](https://github.com/molab-itp/08-FilterTheWorld) (Core Image filters; VideoBooth uses them on frames of a chosen clip instead of the live camera)
- [08-CameraRecorder](https://github.com/molab-itp/08-CameraRecorder) (playback with `AVPlayer` / `VideoPlayer`; recording skipped to keep it simple)

## Progress

- Built a one-screen video booth, the moving-picture companion to PhotoBooth. `PhotosPicker` with `matching: .videos` picks a clip (no photo-library permission).
- The clip plays on a loop, and an effect row switches between Original, Comic, Noir, Thermal, X-Ray, and Invert. An `AVVideoComposition` runs a `CIFilter` on every frame before it's shown, which is what makes the live effect switch work. It does not save or export a new file.
- Drafted with AI help (Claude) and merged into `main` on Nov 6 ([PR #5](https://github.com/cvd9683-gif/molab-2026-itp-cathy/pull/5)).

## Problems

- Assembled without Xcode, so it has not been compiled, run in the simulator, or tested on a device yet.
- The simulator Photos library starts empty, so you have to drag a `.mov`/`.mp4` onto the simulator window before there's a clip to pick. On a real iPhone, your own videos are already there.

## Plans

- Open `VideoBooth/VideoBooth.xcodeproj` on my Mac, press Cmd-R, and try a short clip in the simulator and on my iPhone.
