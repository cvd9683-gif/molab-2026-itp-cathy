//
//  TodayView.swift
//  MoodJournal
//
//  Pick a mood, add a note if you want, and save.
//  After saving, the Router sends you to the Journal page.
//

import SwiftUI

struct TodayView: View {
  @Environment(PageModel.self) var pageModel
  @Environment(Journal.self) var journal

  @State private var mood: Mood? = nil
  @State private var note = ""

  var body: some View {
    VStack(spacing: 24) {
      Text("How are you, right now?")
        .font(.title3)
        .foregroundStyle(.secondary)

      HStack(spacing: 12) {
        ForEach(Mood.allCases, id: \.self) { m in
          Button {
            mood = m
          } label: {
            VStack {
              Text(m.emoji)
                .font(.system(size: 44))
              Text(m.name)
                .font(.caption)
                .foregroundStyle(.primary)
            }
            .padding(10)
            .background(
              RoundedRectangle(cornerRadius: 16)
                .fill(m.color.opacity(mood == m ? 0.35 : 0.08))
            )
          }
        }
      }

      TextField("What's behind it? (optional)", text: $note, axis: .vertical)
        .lineLimit(3...6)
        .textFieldStyle(.roundedBorder)

      Button {
        if let mood {
          journal.add(mood: mood, note: note)
          self.mood = nil
          note = ""
          pageModel.pageTag = .journal
        }
      } label: {
        Text("Save this moment")
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      .disabled(mood == nil)
    }
    .padding()
    // a small tap in the hand when an entry is saved
    .sensoryFeedback(.success, trigger: journal.entries.count)
  }
}

#Preview {
  TodayView()
    .environment(PageModel())
    .environment(Journal())
}
