//
//  Journal.swift
//  MoodJournal
//
//  The data model. Every change is saved to journal.json in the app's
//  documents folder, and loaded again when the app starts.
//

import SwiftUI

// One moment you wrote down
struct Entry: Codable, Identifiable {
  var id = UUID()
  var date = Date()
  var mood: Mood
  var note: String
}

@Observable
class Journal {
  var entries: [Entry] = []
  let fileName = "journal.json"

  init() {
    do {
      entries = try loadJSON([Entry].self, fileName: fileName)
    } catch {
      // First launch: there is no file yet, so start with an empty journal
      print("Journal init loadJSON error \(error)")
    }
  }

  func add(mood: Mood, note: String) {
    entries.append(Entry(mood: mood, note: note))
    save()
  }

  func delete(_ entry: Entry) {
    entries.removeAll { $0.id == entry.id }
    save()
  }

  func save() {
    do {
      try saveJSON(fileName: fileName, val: entries)
    } catch {
      print("Journal save error \(error)")
    }
  }
}
