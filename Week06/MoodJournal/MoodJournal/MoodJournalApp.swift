//
//  MoodJournalApp.swift
//  MoodJournal
//
//  Week06 — Router navigation (06-Router) + saving data as JSON (06-ImageEditDemoJSON)
//

import SwiftUI

@main
struct MoodJournalApp: App {
  // Both models live here, at the top, and are handed down with .environment
  @State var pageModel = PageModel()
  @State var journal = Journal()

  var body: some Scene {
    WindowGroup {
      MainView()
        .environment(pageModel)
        .environment(journal)
    }
  }
}
