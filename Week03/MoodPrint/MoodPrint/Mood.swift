//
//  Mood.swift
//  MoodPrint
//

import SwiftUI

// A mood decides how the 10print pattern looks:
// its colors, how thick the lines are, and which way the slashes lean.
struct Mood: Identifiable {
  var id: String { name }
  var name: String
  var emoji: String
  var feeling: String       // one line shown on the drawing screen
  var colors: [Color]       // a random color is picked from this array for each tile
  var background: Color
  var lineWidth: Double
  var forwardChance: Double // 0.5 = even mix, closer to 1.0 = mostly "/"
}

// Array of all the moods shown on the home screen
let moods: [Mood] = [
  Mood(name: "Calm", emoji: "🌊",
       feeling: "slow, soft, mostly leaning one way",
       colors: [.teal, .blue, .mint],
       background: Color(red: 0.93, green: 0.97, blue: 1.0),
       lineWidth: 4, forwardChance: 0.8),
  Mood(name: "Joyful", emoji: "🌼",
       feeling: "bright and bouncy",
       colors: [.yellow, .orange, .pink, .red],
       background: Color(red: 1.0, green: 0.98, blue: 0.9),
       lineWidth: 8, forwardChance: 0.5),
  Mood(name: "Anxious", emoji: "⚡️",
       feeling: "sharp, crowded, can't settle",
       colors: [.black, .red, .gray],
       background: .white,
       lineWidth: 12, forwardChance: 0.5),
  Mood(name: "Tired", emoji: "🌙",
       feeling: "thin lines fading into the dark",
       colors: [.indigo, .purple, .gray],
       background: Color(red: 0.08, green: 0.08, blue: 0.15),
       lineWidth: 2, forwardChance: 0.3),
]
