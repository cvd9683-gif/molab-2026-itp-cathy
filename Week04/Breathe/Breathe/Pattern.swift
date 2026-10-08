//
//  Pattern.swift
//  Breathe
//

import SwiftUI

// One step of a breath: breathe in, hold, or breathe out
struct Phase {
  var name: String     // shown on screen
  var seconds: Int     // how long this step lasts
  var sound: String    // file played when this step starts
  var size: Double     // how big the circle is during this step (0.0 - 1.0)
}

let inhale = 1.0  // circle size when lungs are full
let exhale = 0.4  // circle size when lungs are empty

// A breathing pattern is an array of phases that repeats
struct Pattern: Identifiable {
  var id: String { name }
  var name: String
  var emoji: String
  var about: String
  var color: Color
  var phases: [Phase]
}

let patterns: [Pattern] = [
  Pattern(name: "Calm", emoji: "🌊",
          about: "in 4, out 6: a longer out-breath slows you down",
          color: .teal,
          phases: [
            Phase(name: "Breathe in", seconds: 4, sound: "inhale.wav", size: inhale),
            Phase(name: "Breathe out", seconds: 6, sound: "exhale.wav", size: exhale),
          ]),
  Pattern(name: "Box", emoji: "🟦",
          about: "in 4, hold 4, out 4, hold 4: steady and even",
          color: .blue,
          phases: [
            Phase(name: "Breathe in", seconds: 4, sound: "inhale.wav", size: inhale),
            Phase(name: "Hold", seconds: 4, sound: "hold.wav", size: inhale),
            Phase(name: "Breathe out", seconds: 4, sound: "exhale.wav", size: exhale),
            Phase(name: "Hold", seconds: 4, sound: "hold.wav", size: exhale),
          ]),
  Pattern(name: "Sleep", emoji: "🌙",
          about: "in 4, hold 7, out 8: for winding down at night",
          color: .indigo,
          phases: [
            Phase(name: "Breathe in", seconds: 4, sound: "inhale.wav", size: inhale),
            Phase(name: "Hold", seconds: 7, sound: "hold.wav", size: inhale),
            Phase(name: "Breathe out", seconds: 8, sound: "exhale.wav", size: exhale),
          ]),
]
