# Wiki 9 — Cathy

## Links

**Proposal draft:** [`proposal.md`](./proposal.md) (main idea: **Music Timeline**, plus other concepts)

**Firebase Option 1:** [`MakeItSo`](./MakeItSo), a reminders list synced with Cloud Firestore ([README](./README.md))

**References:** Peter Friese's [MakeItSo tutorial](https://peterfriese.github.io/MakeItSo/tutorials/makeitso/) chapters 1–4; class copy [09-MakeItSo](https://github.com/molab-itp/09-MakeItSo).

## Progress

- First draft of my final project proposal, assembled from my idea list. The pick for now is **Music Timeline**: log the songs that defined each month of your life, scroll your own timeline, and see friends' timelines (likes and comments). Stretch ideas on the list include a shared café / library DJ room, a BeReal-style song of the day, playlist rooms, an adlib counter, and a sample-web of connections.
- This continues a web prototype I started in Shared Minds ([`week-4-music-map`](https://github.com/cvd9683-gif/shared-minds/tree/main/week-4-music-map)).
- Firebase Option 1: a simplified MakeItSo reminders app. Data lives in Cloud Firestore; a snapshot listener updates the list when anything changes, which is the multi-user part. Written with AI assistance.

## Problems

- No `GoogleService-Info.plist` is committed (it's gitignored on purpose). I still need to add my own Firebase config before the app will show data; without it, MakeItSo only shows a "not set up" message.
- Assembled without Xcode, so MakeItSo has not been compiled, run, or connected to a Firebase project yet.

## Plans

- Finish the Week 10 proposal and week-by-week plan. Build the offline timeline first, then add Firestore sharing, so the app is still useful if Firebase setup takes time.

## Questions

- Should "friends" be a real friend list, or (simpler for class) everyone who shares into one lobby, like MoLobby?
- Month only, or also custom "periods" (e.g. "summer 2023", "first semester")?
- Is a shared playlist enough as a text/link list, or should it open in Apple Music?

## AI prompts

**1. Wednesday, Nov 11, 2026.** Tool: **molab assistant**. Triggered by Cathy's message (quoted under Course planning in [`AI-PROMPTS.md`](../AI-PROMPTS.md)): "i want u to do all the missing assignments that i have and push them to github to my molab repo when its done."

- **Prompt:** The assistant's plan, stated in this chat the same morning: Weeks 09–13 were still missing; Week 09 would be a proposal draft from Cathy's idea list plus a small Firebase app; Week 10 would be the final proposal and a week-by-week plan for Music Timeline; Weeks 11–13 would build the app in steps with docs; then push to her molab repo. Course spec: [Week 09 homework](https://github.com/molab-itp/content-2026-itp/blob/main/weeks/09_multi.md#homework-week09). No separate brief file was found; the same wording is in [`AI-PROMPTS.md`](../AI-PROMPTS.md).
- **Produced:** [`proposal.md`](./proposal.md) (Music Timeline plus other ideas) and [`MakeItSo`](./MakeItSo), committed 9:54 AM ET.
