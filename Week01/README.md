# Week 01

[Student wiki page](./wiki.md): languages I've used, favorite mobile app, final project ideas.

## Part 2 — text art playground

[`TextArt.playground`](./TextArt.playground) — two pages, both plain Foundation
(no UIKit), so they run in Xcode *and* from Terminal.

| Page | What it draws | Language features |
| --- | --- | --- |
| `text art` | banner, diamond, sine wave, ripple field, gradient border | `let` / `var`, nested `for` loops, functions with default + labelled arguments, `Array<Character>` indexing |
| `generative random` | mirrored mandala, random walk | a seeded `RandomNumberGenerator` struct, `inout` generator arguments, optionals, `dropLast` / `reversed` |

Open `TextArt.playground` in Xcode and show the console with **Cmd-Shift-Y** —
`print` output does not appear in the results sidebar.

To run a page without Xcode:

```
swift "Week01/TextArt.playground/Pages/text art.xcplaygroundpage/Contents.swift"
```

The `generative random` page is seeded (`let seed: UInt64 = 20_250_910`), so the
same seed always produces the same piece. Change the seed for a new one.

Errors I hit while writing these are documented in comments at the bottom of
each page (String integer subscripting, `Character` vs `String` concatenation,
unwrapping `randomElement`, `inout` generators, and arithmetic overflow in the
hash-style PRNG).

## Part 1 — swift fundamentals plan

Primary: [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui), Days 1–14, aiming to finish fundamentals by Week 03.
Secondary reference: [The Swift Programming Language — A Swift Tour](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/) for anything that needs a second explanation.

| Week | Target | Hours | Notes |
| --- | --- | --- | --- |
| 01 | Days 1–7 (variables, types, collections, conditions, loops, functions) |  |  |
| 02 | Days 8–11 (closures, structs, access control) |  |  |
| 03 | Days 12–14 (classes, protocols, optionals) + checkpoint projects |  |  |
