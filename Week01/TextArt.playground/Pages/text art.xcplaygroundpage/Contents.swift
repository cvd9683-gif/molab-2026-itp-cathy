//: [Next](@next)
// Week 01 — Part 2: text art
//
// Brief: demonstrate variables, for-loops, and functions.
// Only Foundation is imported, so this page also runs from Terminal:
//     swift "Pages/text art.xcplaygroundpage/Contents.swift"

import Foundation

// MARK: - Variables

let width = 41                  // odd width keeps every drawing symmetric
let ramp = Array("·-=+*#%@")    // dark -> light, indexed by brightness
let title = "TEXT ART"
var frameCount = 0              // var, because each drawing bumps it

// MARK: - Functions

/// `String` has no integer subscript in Swift, and there is no `"=" * 10`
/// operator either, so repetition gets its own tiny function.
func repeated(_ s: String, _ n: Int) -> String {
    var out = ""
    for _ in 0..<n {
        out += s
    }
    return out
}

func centered(_ s: String, in w: Int) -> String {
    let pad = max(0, w - s.count)
    let left = pad / 2
    return repeated(" ", left) + s + repeated(" ", pad - left)
}

func banner(_ text: String) {
    frameCount += 1
    print("╔" + repeated("═", width) + "╗")
    print("║" + centered("\(text)  ·  #\(frameCount)", in: width) + "║")
    print("╚" + repeated("═", width) + "╝")
}

/// Maps a brightness in 0...1 onto a character of `ramp`.
func shade(_ v: Double) -> Character {
    let clamped = min(max(v, 0), 1)
    let index = Int((clamped * Double(ramp.count - 1)).rounded())
    return ramp[index]
}

/// Nested for-loops: rows outside, columns inside.
func diamond(size: Int, fill: Character = "◆") {
    for row in 0..<(size * 2 - 1) {
        let distance = abs(row - (size - 1))     // 0 at the widest row
        let cells = size - distance
        var line = ""
        for _ in 0..<cells {
            line += "\(fill) "
        }
        // dropLast() removes the trailing space so centered() stays symmetric
        print(centered(String(line.dropLast()), in: width))
    }
}

/// A sine wave plotted one column at a time.
func wave(rows: Int, cols: Int, cycles: Double) {
    for row in 0..<rows {
        var line = ""
        for col in 0..<cols {
            let angle = (Double(col) / Double(cols)) * cycles * 2 * .pi
            let y = (sin(angle) + 1) / 2                     // 0...1
            let here = Int((y * Double(rows - 1)).rounded())
            line.append(here == row ? "○" : " ")
        }
        print(line)
    }
}

/// Concentric ripples: brightness comes from the distance to the centre.
func ripples(rows: Int, cols: Int, rings: Double) {
    let cx = Double(cols - 1) / 2
    let cy = Double(rows - 1) / 2
    for row in 0..<rows {
        var line = ""
        for col in 0..<cols {
            let dx = (Double(col) - cx) / cx
            let dy = ((Double(row) - cy) / cy) * 2            // characters are ~2x tall
            let distance = sqrt(dx * dx + dy * dy)
            let brightness = (cos(distance * rings * .pi) + 1) / 2
            line.append(shade(brightness))
        }
        print(line)
    }
}

// MARK: - Draw

banner(title)
diamond(size: 8)

banner("WAVE")
wave(rows: 11, cols: width, cycles: 2)

banner("RIPPLES")
ripples(rows: 17, cols: width, rings: 3)

banner("BORDERS")
for step in 1...6 {
    let row = repeated("◇ ", step) + repeated("◆ ", 7 - step)
    print(centered(String(row.dropLast()), in: width))
}

banner("FIN")

// MARK: - Issues / errors I hit
//
// 1. `ramp[index]` only works because `ramp` is `[Character]`.
//    Writing `let ramp = "·-=+*#%@"` and then `ramp[index]` fails with:
//       'subscript(_:)' is unavailable: cannot subscript String with an Int
//    Swift Strings are indexed by String.Index, not Int — `Array(...)` sidesteps it.
//
// 2. `line += fill` inside `diamond` failed:
//       cannot convert value of type 'Character' to expected argument type 'String'
//    Fixed with string interpolation: `line += "\(fill) "`.
//
// 3. `.pi` needs the type to be inferable. `Double(col) * .pi` is fine here;
//    a bare `let x = .pi` is not.
//
// 4. Playground quirk: `print` output lands in the console (Cmd-Shift-Y),
//    not the results sidebar. The sidebar only shows "(41 times)"-style counts.
