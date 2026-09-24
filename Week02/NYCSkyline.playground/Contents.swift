// New York skyline at night

import Foundation

// load a text file from the Resources folder
func load(_ file: String) -> [String] {
    let path = Bundle.main.path(forResource: file, ofType: "txt")
    let text = try! String(contentsOfFile: path!, encoding: .utf8)
    return text.components(separatedBy: "\n")
}

// put two pieces of ascii art side by side
func combine(_ left: [String], _ right: [String]) -> [String] {
    // find the widest line on the left
    var width = 0
    for line in left {
        if line.count > width {
            width = line.count
        }
    }
    var result: [String] = []
    for i in 0..<left.count {
        var line = left[i]
        line += String(repeating: " ", count: width - line.count + 1)
        line += right[i]
        result.append(line)
    }
    return result
}

// the sky: stars, a moon, and shooting stars
let sky = load("sky")
for line in sky {
    print(line)
}

// the city: glue the buildings together one by one
let buildings = ["short", "tall", "empire", "short", "chrysler", "tall", "short"]
var city = load(buildings[0])
for i in 1..<buildings.count {
    city = combine(city, load(buildings[i]))
}
for line in city {
    print(line)
}

// the ground
print(String(repeating: "=", count: 64))

// Errors / issues:
//
// - The short building file had one less line than the others, so it sat
//   one line too high. combine() matches lines by number, so every
//   building file needs the same number of lines (12). I added a blank line
//   at the top of short.txt.
// - I first tried an ascii brain, but it looked upside down, so I switched
//   to a night sky and skyline.
//
