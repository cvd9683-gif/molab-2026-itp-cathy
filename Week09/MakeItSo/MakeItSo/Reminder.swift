//
//  Reminder.swift
//  MakeItSo
//
//  One reminder. Codable lets Firestore turn it into a document and back.
//  @DocumentID fills in `id` with the Firestore document's ID when we read it.
//

import Foundation
import FirebaseFirestore

struct Reminder: Identifiable, Codable {
  @DocumentID var id: String?
  var title: String
  var isCompleted = false
}

extension Reminder {
  // The Firestore collection all reminders live in
  static let collectionName = "reminders"

  // Used by the preview so it shows something without Firebase
  static let samples = [
    Reminder(title: "Build sample app", isCompleted: true),
    Reminder(title: "Create tutorial"),
    Reminder(title: "Write final project proposal"),
  ]
}
