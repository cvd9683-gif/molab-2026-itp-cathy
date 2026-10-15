# Wiki 6 — Cathy

## Links

**My project:** [`MoodJournal`](./MoodJournal), a mood log with Router navigation that saves as JSON ([README](./README.md))

**Class repos:**
- [06-Router](https://github.com/molab-itp/06-Router) (`@Observable` `PageModel` instead of `NavigationView`)
- [06-ImageEditDemoJSON](https://github.com/molab-itp/06-ImageEditDemoJSON) (`SaveLoadJSON.swift`)

## Weekly summary

- **Week 01:** [`Garden.playground`](../Week01/Garden.playground), a random emoji garden. First Swift code.
- **Week 02:** [`NYCSkyline.playground`](../Week02/NYCSkyline.playground), an ascii New York skyline from text files.
- **Week 03:** [`MoodPrint`](../Week03/MoodPrint), a multi-view SwiftUI 10print where your mood picks the colors, line thickness and slant.
- **Week 04:** [`Breathe`](../Week04/Breathe), a breathing guide that uses a timer and sound.
- **Week 05:** [`BasicNav`](../Week05/BasicNav), the class demos behind one navigation list, plus a Check-in page saved with `@AppStorage`.
- **Week 06:** [`MoodJournal`](./MoodJournal), MoodPrint's moods kept over time: Router navigation, and every entry saved to a JSON file.

## Progress

- Built a three-page app (Today, Journal, Pattern) where a `switch` on `pageModel.pageTag` replaces `NavigationView`.
- The router isn't just for the bottom bar. Saving on Today sets `pageTag = .journal`, so the app moves you to where your entry appears.
- Saved a whole list (`[Entry]`) to `journal.json` with the generic `saveJSON` / `loadJSON` from class. Last week's `@AppStorage` was only good for single small values.
- Made dates save as ISO 8601 text, so the JSON file is readable when I open it in Terminal.

## Problems

- MoodPrint's `Mood` struct couldn't be saved, because `Color` isn't `Codable`. I rewrote it as an enum with a `String` raw value, and the emoji and color became computed properties.
- On first launch there's no `journal.json`, so `loadJSON` throws. `Journal.init` catches that and starts empty, instead of crashing like the class version's `fatalError`.

## Plans

- Use `PatternView` to draw MoodPrint's 10print from the saved entries, so the pattern is made from your real week.
- Add a soft sound per mood (like Breathe's tones) when you save.

## Questions

- Saving the whole file on every change is simple. When does it get too slow, and is that when SwiftData is worth it?
- With the router, the system back-swipe gesture is gone. How do apps that use this pattern handle going "back"?
