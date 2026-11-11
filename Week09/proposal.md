# Final project proposal — first draft (Week 09)

> First draft, assembled from my idea list with AI help. More than one concept is OK at this stage (per the [Week09 homework](https://github.com/molab-itp/content-2026-itp/blob/main/weeks/09_multi.md#homework-week09)). The pick for now is **Music Timeline**; the others stay on the list in case feedback changes things.

## Main idea: Music Timeline 🎶

**One line:** log the songs that defined each month (or period) of your life, scroll back through your own timeline, and peek at your friends' timelines.

- **Log a song for a month.** Search for the song, pick the month/year it belongs to, and add a short note about what was going on.
- **My timeline.** A vertical timeline with album art, grouped by month, that you can zoom out to a year view.
- **Friends' timelines (multi-user).** See other people's timelines, like a song, leave a comment.
- **Same era (stretch).** Pick a month and see what everyone was listening to then — the start of a "shared playlist from the same era".

**Why:** music is how I remember time. This continues the personal music timeline I started as a web prototype in Shared Minds ([`shared-minds/week-4-music-map`](https://github.com/cvd9683-gif/shared-minds/tree/main/week-4-music-map)), but as a native iPhone app with a social side.

**Tech sketch**

| Part | How |
| --- | --- |
| Song search + album art | free [iTunes Search API](https://performance-partners.apple.com/search-api) (no key, no login) — avoids Spotify OAuth |
| Saving my timeline | JSON file in the app's documents folder (like Week06 MoodJournal / [06-ChipsSaveJSON](https://github.com/molab-itp/06-ChipsSaveJSON)) |
| Friends, likes, comments | Firebase Cloud Firestore + anonymous sign-in (like [09-AnonLobbyCloud](https://github.com/molab-itp/09-AnonLobbyCloud) and the MakeItSo tutorial in this folder) |
| 30-second previews | `previewUrl` from the iTunes API played with `AVPlayer` |

**Feasible in ~3 weeks?** Yes if the order is: offline timeline first → Firestore sharing → polish. The social part is the riskiest, so the offline app has to be useful on its own.

## Other ideas (still on the list)

1. **Café / library DJ room** — friends in the same place take turns adding songs to one shared queue. Fun multi-user twist, but it needs real-time turn-taking and somewhere to actually play the music, which is harder.
2. **Song of the day (BeReal-style)** — once a day everyone posts the song they're on right now; you only see friends' posts after you post. Small and social; could become a feature *inside* Music Timeline later.
3. **Playlist contributor rooms** — a room code, everyone adds songs, the list is the result. Overlaps with the DJ room idea.
4. **Adlib counter** — count the adlibs in a song while it plays (tap along). Silly and fun, but a narrow idea for a final.
5. **Sample web** — show what a song samples and what samples it, as a web of connections. I explored this in the web prototype; a good stretch, but the data (Genius / MusicBrainz) is the hard part.

## Open questions

- Should "friends" be a real friend list, or (simpler for class) everyone who shares into one lobby, like MoLobby?
- Month only, or also custom "periods" (e.g. "summer 2023", "first semester")?
- Is a shared playlist enough as a text/link list, or should it open in Apple Music?
