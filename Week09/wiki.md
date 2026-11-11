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
