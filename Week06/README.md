# Week 06

## MoodJournal: a mood log that remembers

[`MoodJournal`](./MoodJournal) brings back the four moods from Week03's [`MoodPrint`](../Week03/MoodPrint), but now they're kept. Each time you check in, you pick a mood and add a note if you want. The app keeps every entry, so over days you can look back and see a pattern.

| Page | What it does |
| --- | --- |
| ☀️ **Today** | pick 🌊 🌼 ⚡️ 🌙, write what's behind it, **Save this moment** (you feel a small tap in your hand) |
| 📖 **Journal** | every entry, newest first, with the time. Swipe left to delete |
| ⚪️ **Pattern** | one colored dot per entry, oldest first, plus how many of each mood |

### Router navigation, from [06-Router](https://github.com/molab-itp/06-Router)

There's no `NavigationView`. [`PageModel`](./MoodJournal/MoodJournal/PageModel.swift) is an `@Observable` class with a `pageTag`, and [`MainView`](./MoodJournal/MoodJournal/MainView.swift) uses a `switch` on it to pick the page. The bar at the bottom sets `pageTag`.

Because the router is shared through `.environment`, **any page can move you**. After you save on Today, it sends you to Journal so you can see your entry land. When Journal is empty, its button sends you back to Today.

### Saving data as JSON, from [06-ImageEditDemoJSON](https://github.com/molab-itp/06-ImageEditDemoJSON)

- [`Journal`](./MoodJournal/MoodJournal/Journal.swift) holds `entries: [Entry]`. Each `Entry` (id, date, mood, note) is `Codable`.
- Every add or delete calls `saveJSON`, which writes `journal.json` to the app's documents folder. On launch, `Journal.init` calls `loadJSON` to read it back.
- [`SaveLoadJSON.swift`](./MoodJournal/MoodJournal/SaveLoadJSON.swift) is the class's generic version, with dates saved as readable ISO 8601 text and without the force unwraps.
- **What had to change from MoodPrint:** its `Mood` struct held `Color`s, and `Color` isn't `Codable`. Here [`Mood`](./MoodJournal/MoodJournal/Mood.swift) is an enum saved by name (`"calm"`), and its emoji and color are looked up from it.

A saved file looks like this:

```json
[
  {
    "id" : "9C1F...",
    "date" : "2026-10-15T14:02:11Z",
    "mood" : "tired",
    "note" : "long studio night"
  }
]
```

To look at the real file, run the app in the simulator. The Xcode console prints a `cp ... ~/Downloads/.` line you can paste into Terminal.

Open `MoodJournal/MoodJournal.xcodeproj` in Xcode, pick an iPhone simulator, and press **Cmd-R**. Save a few moods, quit the app, open it again: they're still there.
