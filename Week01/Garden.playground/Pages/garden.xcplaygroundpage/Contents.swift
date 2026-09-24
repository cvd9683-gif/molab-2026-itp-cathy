// Random emoji garden

import Foundation

let plants = ["🌱", "🌿", "🍀", "🌵", "🌾", "🌷"]

// print one row of random plants
func drawRow(_ width: Int) {
    var row = ""
    for _ in 0..<width {
        let randomInt = Int.random(in: 0..<plants.count)
        row += plants[randomInt]
    }
    print(row)
}

// print a garden with rows of plants
func drawGarden(_ width: Int, _ height: Int) {
    for _ in 0..<height {
        drawRow(width)
    }
}

drawGarden(8, 5)

// Errors / issues:
//
