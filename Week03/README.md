# Week 03

## MoodPrint: a 10print that changes with how you feel

[`MoodPrint`](./MoodPrint) is a multi-view SwiftUI app. You pick a mood, and it draws a 10print pattern in a SwiftUI `Canvas`.

Based on [03-Canvas-Explore](https://github.com/molab-itp/03-Canvas-Explore):

- **3 views:** `ContentView` (mood list) → `PatternView` (the drawing) + `AboutView`, connected with `NavigationStack` / `NavigationLink`
- **arrays:** `moods` is an array of `Mood`s, each mood has a `colors` array, and the drawing is an array of `Tile`s
- **random numbers:** each tile picks `/` or `\` with `Double.random(in: 0...1) < mood.forwardChance`, and a color with `mood.colors.randomElement()`
- **Shuffle** button refills the tiles array to make a new pattern

| Mood | Colors | Line | Leans |
| --- | --- | --- | --- |
| 🌊 Calm | teal, blue, mint | thin (4) | mostly `/` (80%) |
| 🌼 Joyful | yellow, orange, pink, red | medium (8) | even mix |
| ⚡️ Anxious | black, red, gray | thick (12) | even mix |
| 🌙 Tired | indigo, purple, gray on dark | very thin (2) | mostly `\` (70%) |

Open `MoodPrint/MoodPrint.xcodeproj` in Xcode, pick an iPhone simulator, and press **Cmd-R**.
