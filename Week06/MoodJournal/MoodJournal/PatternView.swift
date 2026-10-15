//
//  PatternView.swift
//  MoodJournal
//
//  The journal as a picture: one colored dot per entry, oldest first,
//  so you can see how your days have been without reading a word.
//

import SwiftUI

struct PatternView: View {
  @Environment(Journal.self) var journal

  let columns = [GridItem(.adaptive(minimum: 28), spacing: 8)]

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        // How many times each mood came up
        HStack {
          ForEach(Mood.allCases, id: \.self) { m in
            VStack {
              Text(m.emoji)
                .font(.title2)
              Text("\(count(m))")
                .font(.headline)
                .foregroundStyle(m.color)
            }
            .frame(maxWidth: .infinity)
          }
        }

        if journal.entries.isEmpty {
          Text("Your pattern starts with your first entry.")
            .foregroundStyle(.secondary)
        } else {
          LazyVGrid(columns: columns, spacing: 8) {
            ForEach(journal.entries) { entry in
              Circle()
                .fill(entry.mood.color.gradient)
                .frame(width: 28, height: 28)
            }
          }
        }
      }
      .padding()
    }
  }

  func count(_ mood: Mood) -> Int {
    journal.entries.filter { $0.mood == mood }.count
  }
}

#Preview {
  PatternView()
    .environment(Journal())
}
