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

## AI prompts

**1. Friday, Nov 6, 2026 (morning).** Tool: **Claude** (Claude Code, via the Claude + Codex Connector). Brief written by the **molab assistant**.

- **Prompt (summary):** In parallel with Week 07, build a beginner-friendly video manipulation app on branch `week08-video-app-claude`: a video-booth companion (pick a short clip, funny visual effects), plain UI, comments, Week08 README with idea / honest run instructions / limitations / attribution. Learn from [08-CameraRecorder](https://github.com/molab-itp/08-CameraRecorder) and [08-FilterTheWorld](https://github.com/molab-itp/08-FilterTheWorld); don't copy them. Don't invent tests or merge. Full text is in [`AI-PROMPTS.md`](../AI-PROMPTS.md).
- **Produced:** [`VideoBooth`](./VideoBooth) and [`README.md`](./README.md), committed 9:57 AM ET, [PR #5](https://github.com/cvd9683-gif/molab-2026-itp-cathy/pull/5) (later merged).
