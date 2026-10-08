//
//  PatternView.swift
//  MoodPrint
//

import SwiftUI

// Swift implementation of the 10print algorithm (based on 03-Canvas-Explore)
// Each tile is a "/" or a "\" with a random color from the mood's colors array.

let columns = 10
let maxRows = 30 // enough rows to fill a tall phone screen

struct Tile {
  var forward: Bool // true = "/", false = "\"
  var color: Color
}

// View 2: draw the pattern for one mood
struct PatternView: View {
  var mood: Mood
  @State private var tiles: [Tile] = []

  var body: some View {
    VStack {
      Canvas { context, size in
        let cell = size.width / Double(columns)
        let style = StrokeStyle(lineWidth: mood.lineWidth, lineCap: .round)

        for row in 0..<maxRows {
          for col in 0..<columns {
            let index = row * columns + col
            if index >= tiles.count { continue }
            let tile = tiles[index]

            let x = Double(col) * cell
            let y = Double(row) * cell
            if y > size.height { continue } // off the bottom of the screen

            var path = Path()
            if tile.forward {
              // "/" bottom left to top right
              path.move(to: CGPoint(x: x, y: y + cell))
              path.addLine(to: CGPoint(x: x + cell, y: y))
            } else {
              // "\" top left to bottom right
              path.move(to: CGPoint(x: x, y: y))
              path.addLine(to: CGPoint(x: x + cell, y: y + cell))
            }
            context.stroke(path, with: .color(tile.color), style: style)
          }
        }
      }
      .background(mood.background)

      Button("Shuffle") {
        tiles = makeTiles(for: mood)
      }
      .buttonStyle(.borderedProminent)
      .padding()
    }
    .navigationTitle("\(mood.emoji) \(mood.name)")
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      tiles = makeTiles(for: mood)
    }
  }
}

// Fill an array with random tiles
func makeTiles(for mood: Mood) -> [Tile] {
  var tiles: [Tile] = []
  for _ in 0..<(columns * maxRows) {
    let forward = Double.random(in: 0...1) < mood.forwardChance
    let color = mood.colors.randomElement()!
    tiles.append(Tile(forward: forward, color: color))
  }
  return tiles
}

#Preview {
  NavigationStack {
    PatternView(mood: moods[0])
  }
}
