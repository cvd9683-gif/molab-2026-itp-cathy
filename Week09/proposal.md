# Final project proposal — first draft (Week 09)

> First draft, assembled from my idea list with AI help. More than one concept is OK at this stage (per the [Week09 homework](https://github.com/molab-itp/content-2026-itp/blob/main/weeks/09_multi.md#homework-week09)). The pick for now is **Date Dice**; the others stay on the list in case feedback changes things.

## Main idea: Date Dice 🎲

**One line:** two people each roll dice on their own phone to plan a date *and* get a "go find" prompt, then each add a photo and a song (plus a short note), and it all builds a shared timeline of their dates.

The dice do both things at once:

- **A plan for the date** — for example, a vibe, an activity, food, and a budget.
- **A "go find" prompt**, like a color walk app — for example, a color, a mood, or a song to go capture together.

The rolls sync between both phones, so you see the same plan and the same prompt. During or after the date, each person adds a photo, a song, and a short note. Those collect into a shared timeline of the dates you've done. The photo and song piece is the part that feels really cute.

**Multi-user:** a shared room in Firebase (anonymous sign-in + Cloud Firestore), like [09-AnonLobbyCloud](https://github.com/molab-itp/09-AnonLobbyCloud) and the MakeItSo tutorial in this folder. Two phones join one room, the rolls show up on both, and the timeline is shared.

**Tech sketch**

| Part | How |
| --- | --- |
| App UI | SwiftUI |
| Photos | `PhotosPicker` (from [Week07 PhotoBooth](../Week07/PhotoBooth)) |
| Song search + album art | free [iTunes Search API](https://performance-partners.apple.com/search-api) (no key, no login) |
| Saving a local timeline | JSON file in the app's documents folder (like Week06 MoodJournal / [06-ChipsSaveJSON](https://github.com/molab-itp/06-ChipsSaveJSON)) |
| Shared room, synced rolls, shared timeline | Firebase Cloud Firestore + anonymous sign-in (like [09-AnonLobbyCloud](https://github.com/molab-itp/09-AnonLobbyCloud) and the MakeItSo tutorial in this folder) |

**Feasible in ~3 weeks?** Yes if the order is: offline dice + local timeline first → Firebase room sync and the shared timeline → polish. The social part is the riskiest, so the offline app has to be useful on its own. Photos need to stay small (compressed in Firestore, or Firebase Storage) — that's a choice to make when the sharing layer goes in.

## Other ideas (still on the list)

1. **Music Timeline** (previous pick) — log the songs that defined each month of your life, scroll back through your own timeline, and peek at your friends' timelines. Continues a web prototype from Shared Minds ([`shared-minds/week-4-music-map`](https://github.com/cvd9683-gif/shared-minds/tree/main/week-4-music-map)).
2. **Music map**
3. **My dancing trees as an app**
4. **Memory bouquet**
5. **Journal → mood playlist**
6. **AR album cover scanner**
7. **Do You See What I Mean** as an app, or a Netflix-game-type thing

## Open questions

- Is this for couples only, or for friends too?
