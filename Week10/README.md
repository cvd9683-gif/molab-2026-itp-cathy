# Week 10 — Final project proposal: Music Timeline

Homework: [Week10 Multi User Experience 2](https://github.com/molab-itp/content-2026-itp/blob/main/weeks/10_multi.md#homework-week10) — describe the final project and include a week-by-week work plan. Earlier draft with other ideas: [`Week09/proposal.md`](../Week09/proposal.md).

## Description

**Music Timeline** is an iPhone app for logging the songs that defined each month of your life. You search for a song, say which month it belongs to, and write a line about what was going on. The app lays your songs out as a scrolling timeline with album art, month by month, and can zoom out to whole years. Tap a song to see your note and hear a 30-second preview.

The social side: you can share your timeline, scroll through friends' timelines, like a song, and leave a comment. A **Same era** screen picks one month and shows what everyone was listening to then, as a list you can share — a first step toward "make a shared playlist from the same era".

It grows out of the web music timeline I prototyped in Shared Minds ([`week-4-music-map`](https://github.com/cvd9683-gif/shared-minds/tree/main/week-4-music-map)), this time native, mobile, and multi-user.

### Who it's for

People who connect memories to music and like seeing how their taste changed — and friends who want to compare "what were you listening to in March 2022?".

### Core features (must have)

- Search songs with the free iTunes Search API (title, artist, album art, preview link) — or type a song in by hand.
- Pick the month/year, add a note, save. Edit and delete later.
- Timeline grouped by month, plus a year view.
- Saved on the phone as JSON, so it works with no account and no internet (except song search and art).

### Multi-user features

- Anonymous Firebase sign-in + a display name.
- Share my timeline to Cloud Firestore; everyone who shares appears in a **Friends** list (a class-style lobby, like MoLobby).
- View a friend's timeline; like a song ❤️ and comment 💬.
- **Same era**: everyone's songs for one month, shareable as a text playlist.

### Stretch

- A small recap (songs per year, top artists).
- "Open in Apple Music" links.
- Later: a café / library shared-DJ-room mode (my other idea).

### Tech

SwiftUI (iOS 17), `@Observable` model, JSON save/load (from Week06), `URLSession` + `Codable` for the iTunes API, `AsyncImage` for art, `AVPlayer` for previews, Firebase iOS SDK via Swift Package Manager (FirebaseAuth, FirebaseFirestore). No Spotify (avoids OAuth).

## Week-by-week work plan

| Week | Goal | Done when |
| --- | --- | --- |
| **10** | Proposal + plan (this page). Decide data model: `Entry { title, artist, album, artworkURL, previewURL, month, note }`. | proposal on the wiki, feedback from a partner |
| **11** | **Offline core.** Song search, add / edit / delete, month + year views, detail with preview, JSON save. Sample songs so anyone can try it. | app usable with no Firebase at all → [`Week11`](../Week11) |
| **12** | **Social layer.** Firebase (anonymous auth + Firestore), share my timeline, Friends list, friend timeline, likes + comments, Same era screen. App still runs if Firebase isn't set up. | two devices can see each other's timelines → [`Week12`](../Week12) |
| **13** | **Polish + docs.** Search/filter, recap chart, Apple Music links, empty states, testing guide, sources, lessons learned, next steps. | buildable and testable by someone else → [`Week13`](../Week13) |
| **14** | Present. | demo on device |

## Risks

- **Firebase setup** (plist, rules, package resolve) can eat a class session → keep the app fully usable offline.
- **iTunes Search API** is unofficial-ish and rate-limited → always allow typing a song in by hand.
- **Scope creep** (DJ room, sample web) → stretch only after Week 13 docs are done.

## Feedback

_Partner feedback goes here after the pairing in class._

## Wiki notes to paste (draft — edit before posting)

> **Week 10** — final project: *Music Timeline*, log the songs that defined each month of your life and see friends' timelines. Proposal + week-by-week plan: [`Week10/README.md`](https://github.com/cvd9683-gif/molab-2026-itp-cathy/blob/main/Week10/README.md). progress: _…_ problems: _…_ plans: Week 11 offline timeline, Week 12 Firestore sharing, Week 13 polish + docs. questions: _…_

---

Written with AI assistance (Grok Bot, an AI assistant working in my GitHub account) from my own idea list and project choice.
