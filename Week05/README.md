# Week 05

## BasicNav

[`BasicNav`](./BasicNav) is one app that collects the class examples behind a single navigation list. It's the starting point for this week's homework.

Built the way the assignment describes:

1. **Copied [03-ImageUiDemo-1-symbols](https://github.com/molab-itp/03-ImageUiDemo-1-symbols) and started from `Page9`.** `Page9` is a `NavigationView` + `List` of `NavigationLink`s to `Page1`–`Page8`, and it's the app's first screen.
2. **Added [03-UIGraphics-View](https://github.com/molab-itp/03-UIGraphics-View)** as `UIGraphicsView.swift`. I renamed its `ContentView` to `UIGraphicsView` so the name says what it is. It draws an image in code with `UIGraphicsImageRenderer`.
3. **Added `PlayAudioView` from [04-Audio-State-Demo](https://github.com/molab-itp/04-Audio-State-Demo)**, plus its three sound files (`bbc-birds-1.m4a`, `bbc-birds-2.m4a`, `scale-1.m4a`). Play, Stop and Next cycle through them with `AVAudioPlayer`.

| Row in Page9 | What it shows |
| --- | --- |
| Page1 – Page8 | the SF Symbols layout demos (stacks, arrays + ForEach, List, navigation, controls, Picker) |
| UIGraphicsView | an image computed with `UIGraphicsImageRenderer` |
| PlayAudioView | audio playback from files in the app bundle (remembers which sound you were on) |
| AppStorageView | `@AppStorage` demo: your name and a score, saved on the device |
| HeartPulseView | a heart drawn with a custom `Shape` that pulses when you tap Play |

### Part 2: app storage

Added [05-AppStorageDemo](https://github.com/molab-itp/05-AppStorageDemo) and connected it to the rest of the app, so saved data shows up across pages:

- **`AppStorageView`** (new row): the class demo, plus a `TextField` to type your own name. `@AppStorage("username")` saves it as you type.
- **`Page9`** reads the same `@AppStorage("username")` key, so its title greets you, e.g. **"Hi, Cathy"**. It still says it after you quit and reopen the app.
- **`PlayAudioView`**: `soundIndex` changed from `@State` to `@AppStorage("soundIndex")`, so the app remembers which sound you were on. I also added `.onDisappear { player?.stop() }`, so the looping sound stops when you go back to the list.

To test: type your name, go back (the title changes), then stop the app in Xcode and run it again. Your name is still there.

### Part 2: heart shapes

Also added [05-Heart-Shapes](https://github.com/molab-itp/05-Heart-Shapes), from Apple's [Animating Shapes](https://developer.apple.com/tutorials/sample-apps/animatingshapes) sample:

- **`HeartPulse.swift`**: `Heart` is a custom `Shape`. Its `path(in:)` draws the heart from two curves and two arcs. `PulsingHeart` grows and shrinks forever with `withAnimation(.easeInOut.repeatForever(autoreverses: true))`.
- **`ShapeButtonStyle.swift`**: the Play/Reset button. It uses `@Binding` to switch the `pulsing` flag that lives in `HeartPulseView`.

**One change to the class code:** in `Page9`, `.navigationTitle` was attached outside the `NavigationView`, so the title never showed. I moved it inside, onto the `List`, and named it "BasicNav".

Open `BasicNav/BasicNav.xcodeproj` in Xcode, pick an iPhone simulator, and press **Cmd-R**.
