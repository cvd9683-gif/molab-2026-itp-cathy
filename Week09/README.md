# Week 09

Homework: [Week09 Multi User Experience 1](https://github.com/molab-itp/content-2026-itp/blob/main/weeks/09_multi.md#homework-week09)

| Part | What | Where |
| --- | --- | --- |
| 1 | First draft of the final project proposal (main idea **Date Dice** + other concepts) | [`proposal.md`](./proposal.md) |
| 2 | Firebase **Option 1**: build a Firebase tutorial app — **MakeItSo** | [`MakeItSo`](./MakeItSo) |

## Part 2: MakeItSo (Firebase tutorial, chapters 1–4)

[`MakeItSo`](./MakeItSo) is a reminders list whose data lives in **Cloud Firestore**. Add a reminder, tick it off, rename it, or swipe to delete. Because it uses a Firestore *snapshot listener*, a change made on one phone shows up on every other phone using the same Firebase project — that's the multi-user part.

| On screen | What it does |
| --- | --- |
| ⭕️ **Circle** | tap to mark the reminder done / not done |
| ✏️ **Title** | tap, edit, press return to save the new title |
| 👈 **Swipe left** | delete |
| ➕ **New Reminder** | sheet with a title field; return or **Add** saves it |

It follows Peter Friese's [MakeItSo tutorial](https://peterfriese.github.io/MakeItSo/tutorials/makeitso/) chapters 1–4 ("Building a simple UI" → "Storing data in the cloud"), skipping the emulator chapter as the class page says. The class copy [09-MakeItSo](https://github.com/molab-itp/09-MakeItSo) was the reference for the Firebase setup.

### How the code works

Four small files:

- [`MakeItSoApp.swift`](./MakeItSo/MakeItSo/MakeItSoApp.swift) — `@main`, plus an `AppDelegate` that calls `FirebaseApp.configure()`. It only does that when `GoogleService-Info.plist` is actually in the app, so the app shows a message instead of crashing when the file is missing.
- [`Reminder.swift`](./MakeItSo/MakeItSo/Reminder.swift) — the `Codable` struct. `@DocumentID` is filled in with the Firestore document ID when a reminder is read.
- [`RemindersRepository.swift`](./MakeItSo/MakeItSo/RemindersRepository.swift) — an `ObservableObject` that listens to the `reminders` collection and adds / updates / deletes documents.
- [`RemindersListView.swift`](./MakeItSo/MakeItSo/RemindersListView.swift) — the list, one `ReminderRow` per reminder, and the `AddReminderView` sheet.

**The new concept this week** is the snapshot listener: instead of asking the database once, `addSnapshotListener` keeps calling us back whenever the data changes, and we just replace the `reminders` array.

### Firebase setup (needed before it shows data)

The Firebase SDK comes in through Swift Package Manager (`firebase-ios-sdk`, up to next major from 11.0.0; products FirebaseCore, FirebaseAuth, FirebaseFirestore). Xcode downloads it the first time you open the project.

**No `GoogleService-Info.plist` is committed** (it's in [`.gitignore`](./.gitignore)) — each person adds their own:

1. In the [Firebase console](https://console.firebase.google.com/), create a project (or use one you already have).
2. Add an **iOS app** with bundle ID `edu.nyu.itp.cathy.MakeItSo` (or change the bundle ID in Xcode to match an existing app).
3. Download `GoogleService-Info.plist` and drag it into the `MakeItSo/MakeItSo` folder in Xcode (tick the MakeItSo target).
4. In the console, create a **Cloud Firestore** database. For a class demo, *test mode* rules work; note they expire after 30 days (the class README warns about this too).

### Run / test it

Open `MakeItSo/MakeItSo.xcodeproj`, wait for the packages to resolve, pick an iPhone, and press **Cmd-R**. Add a reminder, then open the Firestore console and watch the `reminders` collection change. Run it on two devices (or a device + simulator) to see changes sync.

### Known limitations

- Everyone using the same Firebase project shares one list — there is no sign-in or per-user data (the tutorial adds that in later chapters).
- Without the plist the app only shows the "not set up" message.
- Package resolution and the first build can take several minutes because the Firebase SDK is large.

### Attribution

Part 2 is a re-typed, simplified version of the MakeItSo tutorial by Peter Friese (Apache 2.0), using [09-MakeItSo](https://github.com/molab-itp/09-MakeItSo) from class as the reference for the SDK setup. The proposal draft was organized from my own idea list. Both were written with AI assistance (Grok Bot, an AI assistant working in my GitHub account), following the structure and comment style of the earlier weeks in this repo.

> Note: this was assembled in a Linux environment without Xcode, so it has **not** been compiled, run in the simulator, or tested on a device, and no Firebase project was connected. Please build and run it in Xcode to confirm.

## Wiki notes to paste (draft — edit before posting)

> **Week 09** — progress: first draft of my final project proposal (main idea: *Date Dice*, plus other ideas) in [`Week09/proposal.md`](https://github.com/cvd9683-gif/molab-2026-itp-cathy/blob/main/Week09/proposal.md). Firebase Option 1: MakeItSo tutorial in [`Week09/MakeItSo`](https://github.com/cvd9683-gif/molab-2026-itp-cathy/tree/main/Week09/MakeItSo). problems: _…_ plans: Week 11 starts in Figma, then offline dice + local timeline; Week 12 Firebase room sync. questions: _…_
