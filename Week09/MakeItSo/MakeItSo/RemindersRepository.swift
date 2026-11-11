//
//  RemindersRepository.swift
//  MakeItSo
//
//  Talks to Cloud Firestore (tutorial chapter 4, "Storing data in the cloud").
//  A snapshot listener keeps `reminders` in sync: any change in the database,
//  from this phone or another one, shows up here right away.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class RemindersRepository: ObservableObject {
  @Published var reminders = [Reminder]()
  @Published var errorMessage: String?

  private var listener: ListenerRegistration?

  // True when GoogleService-Info.plist was found and Firebase started
  var isFirebaseReady: Bool {
    FirebaseApp.app() != nil
  }

  func subscribe() {
    guard isFirebaseReady else {
      errorMessage = "Firebase is not set up yet. Add GoogleService-Info.plist (see README)."
      return
    }
    if listener != nil { return }

    listener = Firestore.firestore()
      .collection(Reminder.collectionName)
      .addSnapshotListener { [weak self] snapshot, error in
        if let error {
          self?.errorMessage = error.localizedDescription
          return
        }
        guard let documents = snapshot?.documents else { return }
        // Turn every document back into a Reminder (skip any that don't fit)
        self?.reminders = documents.compactMap { document in
          try? document.data(as: Reminder.self)
        }
        self?.errorMessage = nil
      }
  }

  func unsubscribe() {
    listener?.remove()
    listener = nil
  }

  func add(_ reminder: Reminder) {
    guard isFirebaseReady else { return }
    do {
      _ = try Firestore.firestore()
        .collection(Reminder.collectionName)
        .addDocument(from: reminder)
    } catch {
      errorMessage = error.localizedDescription
    }
  }

  func update(_ reminder: Reminder) {
    guard isFirebaseReady, let id = reminder.id else { return }
    do {
      try Firestore.firestore()
        .collection(Reminder.collectionName)
        .document(id)
        .setData(from: reminder, merge: true)
    } catch {
      errorMessage = error.localizedDescription
    }
  }

  func remove(_ reminder: Reminder) {
    guard isFirebaseReady, let id = reminder.id else { return }
    Firestore.firestore()
      .collection(Reminder.collectionName)
      .document(id)
      .delete()
  }
}
