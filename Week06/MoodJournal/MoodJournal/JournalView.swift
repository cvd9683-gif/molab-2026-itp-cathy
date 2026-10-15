//
//  JournalView.swift
//  MoodJournal
//
//  Every saved entry, newest first. Swipe left to delete.
//

import SwiftUI

struct JournalView: View {
  @Environment(PageModel.self) var pageModel
  @Environment(Journal.self) var journal

  var body: some View {
    if journal.entries.isEmpty {
      ContentUnavailableView {
        Label("Nothing here yet", systemImage: "book")
      } description: {
        Text("Entries you save on Today show up here, and stay after you close the app.")
      } actions: {
        Button("Go to Today") {
          pageModel.pageTag = .today
        }
      }
    } else {
      List {
        ForEach(journal.entries.reversed()) { entry in
          EntryRow(entry: entry)
            .swipeActions {
              Button("Delete", role: .destructive) {
                journal.delete(entry)
              }
            }
        }
      }
      .listStyle(.plain)
    }
  }
}

struct EntryRow: View {
  var entry: Entry

  var body: some View {
    HStack(alignment: .top, spacing: 12) {
      Text(entry.mood.emoji)
        .font(.title)
      VStack(alignment: .leading, spacing: 4) {
        Text(entry.mood.name)
          .font(.headline)
          .foregroundStyle(entry.mood.color)
        if !entry.note.isEmpty {
          Text(entry.note)
        }
        Text(entry.date.formatted(date: .abbreviated, time: .shortened))
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
    .padding(.vertical, 4)
  }
}

#Preview {
  JournalView()
    .environment(PageModel())
    .environment(Journal())
}
