# Wiki 5 — Cathy

## Links

**My project:** [`BasicNav`](./BasicNav), one app with a navigation list that holds the class demos, plus app storage and heart shapes ([README](./README.md))

**Class repos:**
- [03-ImageUiDemo-1-symbols](https://github.com/molab-itp/03-ImageUiDemo-1-symbols) (Page1–Page9)
- [03-UIGraphics-View](https://github.com/molab-itp/03-UIGraphics-View)
- [04-Audio-State-Demo](https://github.com/molab-itp/04-Audio-State-Demo) (PlayAudioView)
- [05-AppStorageDemo](https://github.com/molab-itp/05-AppStorageDemo) (Part 2)
- [05-Heart-Shapes](https://github.com/molab-itp/05-Heart-Shapes) (Part 2)

## Weekly summary

- **Week 01:** [`Garden.playground`](../Week01/Garden.playground), a random emoji garden. First Swift code.
- **Week 02:** [`NYCSkyline.playground`](../Week02/NYCSkyline.playground), an ascii New York skyline from text files.
- **Week 03:** [`MoodPrint`](../Week03/MoodPrint), a multi-view SwiftUI 10print where your mood picks the colors, line thickness and slant.
- **Week 04:** `Breathe`, a breathing guide that uses a timer and sound.
- **Week 05:** [`BasicNav`](./BasicNav), the class demos gathered behind one navigation list, plus `@AppStorage` to remember your name and last sound, and a pulsing heart shape.

## Progress

**Part 1: BasicNav**
- Copied Page1–Page9 from 03-ImageUiDemo-1-symbols and made `Page9` the app's first screen.
- Added the `UIGraphicsImageRenderer` demo and renamed its `ContentView` to `UIGraphicsView`, since an app can only have one struct with each name.
- Added `PlayAudioView` and its three `.m4a` files.

**Part 2: app storage** (from [05-AppStorageDemo](https://github.com/molab-itp/05-AppStorageDemo))
- Added `AppStorageView` with a `TextField`, so you can type your name and it's saved on the device.
- `Page9` reads the same `"username"` key, so the list greets you: "Hi, Cathy". Two views share data just by using the same key.
- `PlayAudioView` now uses `@AppStorage("soundIndex")`, so it reopens on the sound you were last on.

**Part 2: heart shapes** (from [05-Heart-Shapes](https://github.com/molab-itp/05-Heart-Shapes))
- Added `HeartPulseView` as a new row. The heart is a custom `Shape` made with a `Path` (two curves + two arcs), and it pulses with a repeating animation.
- Learned `@Binding`: the Play button changes a `@State` value that belongs to the page it sits on.

## Problems

- The "My Shapes" title on `Page9` never showed. `.navigationTitle` was outside the `NavigationView`, and moving it onto the `List` fixed it.
- In `PlayAudioView`, the looping sound kept playing after going back to the list. Fixed with `.onDisappear { player?.stop() }`.
- The sound files have to be inside the app's folder, or `loadBundleAudio` crashes on its `!`.
- The demo's default name was "JHT". I changed it to "friend" in both places. The default has to match in every view that uses the key.

## Plans

- Save my Week04 Breathe settings with `@AppStorage`, like favorite pattern and total rounds breathed.
- Replace `NavigationView` (deprecated) with `NavigationStack`.
- Look at [05-CustomFont](https://github.com/molab-itp/05-CustomFont) for the custom fonts research.

## Questions

- How does `path(in:)` know the size of the heart? Where does `rect` come from?

- `@AppStorage` is for small values. What should I use to save bigger things, like a list of patterns or images?
- `NavigationView` is deprecated. What changes when I switch to `NavigationStack`?
- `PlayAudioView` uses `Bundle.main.path(...)!`, which crashes if a file is missing. What's a safer way to load sounds?
- What's the difference between drawing with `UIGraphicsImageRenderer` (UIKit) and SwiftUI's `Canvas` (Week03)?
