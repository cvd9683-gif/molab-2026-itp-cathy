# Week 04

## Breathe: a breathing guide you can see and hear

[`Breathe`](./Breathe) is a two-page SwiftUI app that uses **time** and **audio playback**. Pick a breathing pattern, press Start, and follow the circle: it grows as you breathe in, rests while you hold, and shrinks as you breathe out. A soft tone marks each change, so you can close your eyes and still follow along.

Based on [04-Audio-State-Demo](https://github.com/molab-itp/04-Audio-State-Demo):

- **2 pages:** `ContentView` (pattern list) → `BreatheView` (the breathing circle), connected with `NavigationStack` / `NavigationLink`
- **time:** `Timer.publish(every: 1, ...)` + `.onReceive(timer)` counts down each phase (like `CountDownTimerView`)
- **audio playback:** `loadBundleAudio()` + `AVAudioPlayer` plays a sound file from the app bundle at the start of each phase (like `PlayAudioView`)
- **animation:** the circle's `scaleEffect` animates over the full length of each phase, so its speed matches the count
- **arrays:** `patterns` is an array of `Pattern`s, and each pattern is an array of `Phase`s that repeats

| Pattern | Steps |
| --- | --- |
| 🌊 Calm | in 4 · out 6 |
| 🟦 Box | in 4 · hold 4 · out 4 · hold 4 |
| 🌙 Sleep | in 4 · hold 7 · out 8 |

### Sounds

I generated the three sounds myself with a small Python script (sine waves with a slow fade), so there are no licensing issues:

- `inhale.wav`: a tone that slides **up**, for breathing in
- `exhale.wav`: a tone that slides **down**, for breathing out
- `hold.wav`: a small bell, for holding

Open `Breathe/Breathe.xcodeproj` in Xcode, pick an iPhone simulator, and press **Cmd-R**. Turn your Mac's volume up to hear the tones.
