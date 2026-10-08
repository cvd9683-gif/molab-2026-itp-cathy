# Wiki 3 — Cathy

## Links

**My project:** [`MoodPrint`](./MoodPrint), a multi-view SwiftUI app that draws a 10print pattern based on your mood ([README](./README.md))

**Class repo:** [03-Canvas-Explore](https://github.com/molab-itp/03-Canvas-Explore)

## Progress

- Read through `CanvasAnimView.swift` in 03-Canvas-Explore to understand how 10print works in `Canvas`: each cell gets a diagonal line going one of two ways, chosen with `Bool.random()`.
- Wanted the randomness to *mean* something, so a mood controls the rules: color palette, line thickness, and how likely a slash is to lean forward.
- Built 3 views: a mood list, the pattern, and an about page, connected with `NavigationStack`.
- Stored the pattern in an array of `Tile`s inside `@State`, so it only changes when I tap **Shuffle** (not every time the view redraws).

## Questions

- The class example uses global variables and `TimelineView` to add one slash at a time. What's the best way to animate the drawing without globals?
- How would I save a pattern I like (as an image, or as a seed) to look at later?
- Could each mood also have a sound, like a soft tone for Calm and a sharp click for Anxious, as each tile is drawn?
