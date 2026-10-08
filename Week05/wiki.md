# Wiki 5 — Cathy

## Links

**My project:** [`BasicNav`](./BasicNav), one app with a navigation list that holds the class demos ([README](./README.md))

**Class repos:**
- [03-ImageUiDemo-1-symbols](https://github.com/molab-itp/03-ImageUiDemo-1-symbols) (Page1–Page9)
- [03-UIGraphics-View](https://github.com/molab-itp/03-UIGraphics-View)
- [04-Audio-State-Demo](https://github.com/molab-itp/04-Audio-State-Demo) (PlayAudioView)

## Weekly summary

- **Week 01:** [`Garden.playground`](../Week01/Garden.playground), a random emoji garden. First Swift code.
- **Week 02:** [`NYCSkyline.playground`](../Week02/NYCSkyline.playground), an ascii New York skyline from text files.
- **Week 03:** [`MoodPrint`](../Week03/MoodPrint), a multi-view SwiftUI 10print where your mood picks the colors, line thickness and slant.
- **Week 04:** `Breathe`, a breathing guide that uses a timer and sound.
- **Week 05:** [`BasicNav`](./BasicNav), the class demos gathered behind one navigation list.

## Progress

- Copied Page1–Page9 from 03-ImageUiDemo-1-symbols and made `Page9` the app's first screen.
- Added the `UIGraphicsImageRenderer` demo and renamed its `ContentView` to `UIGraphicsView`, since an app can only have one struct with each name.
- Added `PlayAudioView` and its three `.m4a` files. The files have to be inside the app's folder or `loadBundleAudio` can't find them.
- Noticed the "My Shapes" title never showed. `.navigationTitle` was outside the `NavigationView`, and moving it onto the `List` fixed it.

## Questions

- `NavigationView` is deprecated. When should I switch to `NavigationStack`, and what changes?
- `PlayAudioView` uses `Bundle.main.path(...)!`, which crashes if a file is missing. What's a safer way to load sounds?
- What's the difference between drawing with `UIGraphicsImageRenderer` (UIKit) and with SwiftUI's `Canvas` (Week03)?
