# Wiki 9 — Cathy

## Links

**Proposal draft:** [`proposal.md`](./proposal.md) (main idea: **Date Dice**, plus other concepts)

**Firebase Option 1:** [`MakeItSo`](./MakeItSo), a reminders list synced with Cloud Firestore ([README](./README.md))

**References:** Peter Friese's [MakeItSo tutorial](https://peterfriese.github.io/MakeItSo/tutorials/makeitso/) chapters 1–4; class copy [09-MakeItSo](https://github.com/molab-itp/09-MakeItSo).

## Progress

- First draft of my final project proposal, assembled from my idea list. The pick for now is **Date Dice**: two people each roll dice on their own phone to plan a date *and* get a "go find" prompt, then each add a photo and a song (plus a short note), and it all builds a shared timeline of their dates. Music Timeline and my other ideas stay on the list.
- Firebase Option 1: a simplified MakeItSo reminders app. Data lives in Cloud Firestore; a snapshot listener updates the list when anything changes, which is the multi-user part. Written with AI assistance.

## Problems

- No `GoogleService-Info.plist` is committed (it's gitignored on purpose). I still need to add my own Firebase config before the app will show data; without it, MakeItSo only shows a "not set up" message.
- Assembled without Xcode, so MakeItSo has not been compiled, run, or connected to a Firebase project yet.

## Plans

- The Week 10 proposal and week-by-week plan are in [`Week10/README.md`](../Week10/README.md). Week 11 starts with designs in Figma, then the offline dice and a local timeline. Week 12 adds the Firebase room and the shared photos and songs.

## Questions

- Is this for couples only, or for friends too?

## AI prompts

**1. Wednesday, Nov 11, 2026.** Tool: **molab assistant**. Triggered by Cathy's message (quoted under Course planning in [`AI-PROMPTS.md`](../AI-PROMPTS.md)): "i want u to do all the missing assignments that i have and push them to github to my molab repo when its done."

- **Prompt:** The assistant's plan, stated in this chat the same morning: Weeks 09–13 were still missing; Week 09 would be a proposal draft from Cathy's idea list plus a small Firebase app; Week 10 would be the final proposal and a week-by-week plan for Music Timeline; Weeks 11–13 would build the app in steps with docs; then push to her molab repo. Course spec: [Week 09 homework](https://github.com/molab-itp/content-2026-itp/blob/main/weeks/09_multi.md#homework-week09). No separate brief file was found; the same wording is in [`AI-PROMPTS.md`](../AI-PROMPTS.md).
- **Produced:** [`proposal.md`](./proposal.md) (Music Timeline plus other ideas) and [`MakeItSo`](./MakeItSo), committed 9:54 AM ET.
