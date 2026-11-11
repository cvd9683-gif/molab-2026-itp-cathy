//
//  RemindersListView.swift
//  MakeItSo
//
//  The list of reminders (tutorial chapters 1–3): tap the circle to check one
//  off, tap the title to edit it, swipe to delete, and "New Reminder" to add.
//

import SwiftUI

struct RemindersListView: View {
  @StateObject private var repository = RemindersRepository()
  @State private var isAddSheetShown = false

  var body: some View {
    List {
      if let message = repository.errorMessage {
        Text(message)
          .font(.footnote)
          .foregroundStyle(.red)
      }
      ForEach(repository.reminders) { reminder in
        ReminderRow(reminder: reminder) { changed in
          repository.update(changed)
        }
        .swipeActions {
          Button("Delete", role: .destructive) {
            repository.remove(reminder)
          }
        }
      }
    }
    .toolbar {
      ToolbarItemGroup(placement: .bottomBar) {
        Button {
          isAddSheetShown = true
        } label: {
          Label("New Reminder", systemImage: "plus.circle.fill")
            .labelStyle(.titleAndIcon)
        }
        Spacer()
      }
    }
    .sheet(isPresented: $isAddSheetShown) {
      AddReminderView { title in
        repository.add(Reminder(title: title))
      }
    }
    .onAppear { repository.subscribe() }
    .onDisappear { repository.unsubscribe() }
  }
}

// One row: a check circle and the title.
struct ReminderRow: View {
  var reminder: Reminder
  var onChange: (Reminder) -> Void

  @State private var title = ""

  var body: some View {
    HStack {
      Button {
        var changed = reminder
        changed.isCompleted.toggle()
        onChange(changed)
      } label: {
        Image(systemName: reminder.isCompleted ? "largecircle.fill.circle" : "circle")
          .font(.title2)
          .foregroundStyle(reminder.isCompleted ? Color.accentColor : .gray)
      }
      .buttonStyle(.plain)

      TextField("Reminder", text: $title)
        .onSubmit {
          var changed = reminder
          changed.title = title
          onChange(changed)
        }
    }
    .onAppear { title = reminder.title }
    .onChange(of: reminder.title) { title = reminder.title }
  }
}

// A small sheet to type a new reminder (tutorial chapter 2).
struct AddReminderView: View {
  var onAdd: (String) -> Void

  @Environment(\.dismiss) private var dismiss
  @State private var title = ""
  @FocusState private var isFocused: Bool

  var body: some View {
    NavigationStack {
      Form {
        TextField("Title", text: $title)
          .focused($isFocused)
          .onSubmit(save)
      }
      .navigationTitle("New Reminder")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") { dismiss() }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button("Add", action: save)
            .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
        }
      }
      .onAppear { isFocused = true }
    }
  }

  func save() {
    let trimmed = title.trimmingCharacters(in: .whitespaces)
    guard !trimmed.isEmpty else { return }
    onAdd(trimmed)
    dismiss()
  }
}

#Preview {
  NavigationStack {
    RemindersListView()
      .navigationTitle("Reminders")
  }
}
