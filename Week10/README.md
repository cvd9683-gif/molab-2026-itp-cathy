# Week 10 — Final project proposal: Date Dice

Homework: [Week10 Multi User Experience 2](https://github.com/molab-itp/content-2026-itp/blob/main/weeks/10_multi.md#homework-week10) — describe the final project and include a week-by-week work plan. Earlier draft with other ideas: [`Week09/proposal.md`](../Week09/proposal.md).

## Description

**Date Dice** is an iPhone app for two people on a date. Each person rolls dice on their own phone. The dice do two things at once: they give you a **plan for the date** (for example, a vibe, an activity, food, and a budget) and a **"go find" prompt**, like a color walk app — a color, a mood, or a song to go capture together. The rolls sync, so both phones show the same plan and the same prompt.

During or after the date, each person adds a **photo**, a **song**, and a short note. Those collect into a **shared timeline** of the dates you've done. The photo and song piece is the part that feels really cute.

### Who it's for

Two people who want a prompt for a date — a plan and something to go find — and a way to keep the photos and songs afterward. Whether that's couples only, or friends too, is still an open question.

### Core features (must have)

- Roll the dice for a date plan *and* a "go find" prompt. (The exact categories can stay simple: plan examples are vibe, activity, food, budget; prompt examples are a color, a mood, or a song to capture.)
- Add a photo (`PhotosPicker`), search for a song (or type one in by hand), and write a short note. Edit and delete later.
- A local timeline of dates, saved on the phone as JSON, so it works with no account and no internet (except song search and art).

### Multi-user features

- Anonymous Firebase sign-in + a display name.
- A shared room in Cloud Firestore (a class-style lobby, like [09-AnonLobbyCloud](https://github.com/molab-itp/09-AnonLobbyCloud) / MoLobby). Two phones join the same room.
- Rolls sync live between both phones, so you both see the same plan and prompt.
- Both people add a photo, a song, and a note to the **shared timeline** of that date, and of the dates you've done together.

### Stretch

- 30-second song previews (`previewUrl` from the iTunes API, played with `AVPlayer`).
- A nicer look back through the timeline (for example, grouping dates by month).
- "Open in Apple Music" links.

### Tech

SwiftUI (iOS 17), `@Observable` model, `PhotosPicker` (from Week07 PhotoBooth), JSON save/load (from Week06), `URLSession` + `Codable` for the iTunes Search API, `AsyncImage` for album art, Firebase iOS SDK via Swift Package Manager (FirebaseAuth, FirebaseFirestore; Firebase Storage only if photos don't fit comfortably in Firestore). No Spotify (avoids OAuth). Photos should stay small — compressed and stored in Firestore, or uploaded to Firebase Storage. That's a Week 12 choice.

## Design in Figma first

I realized that for aesthetics, vibe coding is easier when you design first and then push that to the agent to code. So Week 11 starts in Figma: I'll design the screens and the vibe — the dice screen, the roll result, adding a photo and a song, and the timeline — and then hand those designs to the AI coding agent to build in SwiftUI.

## Week-by-week work plan

| Week | Goal | Done when |
| --- | --- | --- |
| **10** | Proposal + plan (this page). Sketch the data: a date has the plan rolls, the find prompt, each person's photo / song / note, and when it happened; a room holds the two people and the shared timeline. | proposal on the wiki, feedback from a partner |
| **11** | **Design + offline core.** Start in Figma: design the screens and vibe (dice, roll result, add photo/song, timeline), then build the core from those designs — dice that roll a plan *and* a find prompt, add / edit / delete a date (photo, song, note), a local timeline, JSON save. Sample dates so anyone can try it. | Figma designs + app usable with no Firebase at all → [`Week11`](../Week11) |
| **12** | **Social layer.** Firebase (anonymous auth + Firestore), a shared room, rolls sync on both phones, shared timeline with photos and songs. Decide how photos are stored (compressed in Firestore, or Firebase Storage). App still runs if Firebase isn't set up. | two devices can roll together and see the same timeline → [`Week12`](../Week12) |
| **13** | **Polish + docs.** Empty states, testing guide, sources, lessons learned, next steps. Stretch only after the docs are in (previews, a cleaner timeline, Apple Music links). | buildable and testable by someone else → [`Week13`](../Week13) |
| **14** | Present on **Dec 10**. | demo on device |

## Risks

- **Firebase setup** (plist, rules, package resolve) can eat a class session → keep the app fully usable offline.
- **Photos** can get large fast. Full-size images in Firestore are a bad fit, so they need to stay small (compress them, or use Firebase Storage). That's a choice to make in Week 12, and a risk if image upload or size eats the week.
- **iTunes Search API** is unofficial-ish and rate-limited → always allow typing a song in by hand.
- **Scope creep** (extra dice categories, more social features) → stretch only after Week 13 docs are done.
- **PhotosPicker** needs a real photo library; the simulator's library is empty, so photo testing has to happen on a phone.

## Feedback

_Partner feedback goes here after the pairing in class._

---

Written with AI assistance (Grok Bot, an AI assistant working in my GitHub account) from my own idea list and project choice.
