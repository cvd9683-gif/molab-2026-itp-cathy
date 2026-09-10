//: [Previous](@previous)
// Week 01 — Part 2: generative random
//
// Same three ingredients (variables, for-loops, functions), but the art is
// randomised. The generator is seeded so a run can be reproduced — swap
// `seed` for a new number to get a different piece.

import Foundation

// MARK: - Variables

let seed: UInt64 = 20_250_910
let rows = 15
let half = 10                       // half-width; the art is mirrored
let palette = ["◻︎", "◼︎", "◈", "◇", "◆", "·", "▚", "▞"]
let density = 0.72                  // chance a cell is drawn at all

// MARK: - A seeded random source
//
// `Int.random(in:)` uses the system generator and never repeats a run.
// Conforming to RandomNumberGenerator lets the standard `random` APIs
// take `using: &rng` instead, which keeps the output reproducible.
struct SeededGenerator: RandomNumberGenerator {
    private var state: UInt64

    init(seed: UInt64) {
        state = seed &+ 0x9E37_79B9_7F4A_7C15
    }

    mutating func next() -> UInt64 {
        state = state &+ 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }
}

var rng = SeededGenerator(seed: seed)

// MARK: - Functions

func rule(_ label: String) {
    let bar = "─"
    var line = ""
    for _ in 0..<(half * 4) {
        line += bar
    }
    print("\n" + label + " " + line + "\n")
}

/// One row of the mandala: pick `half` cells, then mirror them.
func mirroredRow() -> String {
    var left: [String] = []
    for _ in 0..<half {
        // Double.random(in:using:) needs the inout generator, hence `&rng`.
        let filled = Double.random(in: 0...1, using: &rng) < density
        left.append(filled ? palette.randomElement(using: &rng)! : " ")
    }

    var line = ""
    for cell in left {
        line += cell + " "
    }
    for cell in left.reversed() {
        line += cell + " "
    }
    return line
}

func mandala(rows: Int) {
    var top: [String] = []
    for _ in 0..<rows {
        top.append(mirroredRow())
    }
    for line in top {
        print(line)
    }
    // vertical mirror: skip the last row so the seam isn't doubled
    for line in top.dropLast().reversed() {
        print(line)
    }
}

/// A random walk that leaves a trail — different loop shape, same tools.
func walk(steps: Int, width: Int) {
    var x = width / 2
    for _ in 0..<steps {
        let step = Int.random(in: -1...1, using: &rng)
        x = min(max(x + step, 0), width - 1)
        var line = ""
        for column in 0..<width {
            line += column == x ? "◆" : "·"
        }
        print(line)
    }
}

// MARK: - Draw

rule("mandala  seed \(seed)")
mandala(rows: rows)

rule("random walk")
walk(steps: 18, width: half * 4)

// MARK: - Issues / errors I hit
//
// 1. `palette.randomElement(using: &rng)` returns an Optional — forgetting the
//    `!` (or an `if let`) gives:
//       value of optional type 'String?' must be unwrapped
//
// 2. `rng` has to be a `var`, and every call site needs `&`. With `let rng`:
//       cannot pass immutable value as inout argument
//    …because `next()` mutates the generator's state.
//
// 3. First attempt used `state = state * 0x9E37...` and trapped at runtime:
//       Swift runtime failure: arithmetic operation overflowed
//    Hash-style generators want the wrapping operators `&*` and `&+`.
//
// 4. Emoji vs. text glyphs: "◻︎" carries a variation selector, so `count` is 1
//    but Xcode's console still renders it a touch wider than "◆". Sticking to
//    one glyph family per piece keeps columns lined up.
