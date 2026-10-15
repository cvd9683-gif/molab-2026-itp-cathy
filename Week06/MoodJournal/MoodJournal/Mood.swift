//
//  Mood.swift
//  MoodJournal
//
//  The four moods from Week03's MoodPrint.
//  In MoodPrint, Mood was a struct holding Colors, but Color isn't Codable,
//  so it couldn't be saved as JSON. Here a mood is an enum saved by its name
//  ("calm"), and the emoji and color are looked up from it.
//

import SwiftUI

enum Mood: String, Codable, CaseIterable {
  case calm
  case joyful
  case anxious
  case tired

  var emoji: String {
    switch self {
    case .calm: "🌊"
    case .joyful: "🌼"
    case .anxious: "⚡️"
    case .tired: "🌙"
    }
  }

  var color: Color {
    switch self {
    case .calm: .teal
    case .joyful: .orange
    case .anxious: .red
    case .tired: .indigo
    }
  }

  var name: String { rawValue.capitalized }
}
