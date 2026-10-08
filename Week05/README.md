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
| PlayAudioView | audio playback from files in the app bundle |

**One change to the class code:** in `Page9`, `.navigationTitle` was attached outside the `NavigationView`, so the title never showed. I moved it inside, onto the `List`, and named it "BasicNav".

Open `BasicNav/BasicNav.xcodeproj` in Xcode, pick an iPhone simulator, and press **Cmd-R**.
