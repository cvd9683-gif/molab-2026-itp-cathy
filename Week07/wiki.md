# Wiki 7 — Cathy

## Links

**My project:** [`PhotoBooth`](./PhotoBooth), a one-screen SwiftUI photo booth: choose a photo and try three funny Core Image filters ([README](./README.md))

**Class repo:** [07-Instafilter](https://github.com/molab-itp/07-Instafilter) was a learning reference for PhotosUI and Core Image, not copied as an app.

## Progress

- `PhotosPicker` asks for one image; then a menu switches between Original, Comic, Pixelated, and Bulge. Original is the unfiltered (resized) preview; Bulge balloons the middle of the photo outward.
- Each filter starts from the same upright preview, drawn with `UIGraphicsImageRenderer` at most 1200 pixels on the longest side, so effects don't pile up. Changing photos cancels the previous load so the latest selection wins.
- Drafted with AI help (OpenAI Codex) and merged into `main` on Nov 6 ([PR #4](https://github.com/cvd9683-gif/molab-2026-itp-cathy/pull/4)).

## Problems

- The app was assembled without Xcode, so it has not been compiled, run in the simulator, or tested on a device yet.
- The simulator Photos library starts empty, so the picker has nothing to show until you drag a photo into the simulator window.

## Plans

- Open `PhotoBooth/PhotoBooth.xcodeproj` on my Mac, press Cmd-R, and try a photo in the simulator and on my iPhone.
