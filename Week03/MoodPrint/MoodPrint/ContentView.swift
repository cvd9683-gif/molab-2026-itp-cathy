//
//  ContentView.swift
//  MoodPrint
//

import SwiftUI

// View 1: pick a mood from a list
struct ContentView: View {
  var body: some View {
    NavigationStack {
      List(moods) { mood in
        NavigationLink {
          PatternView(mood: mood)
        } label: {
          HStack {
            Text(mood.emoji)
              .font(.largeTitle)
            VStack(alignment: .leading) {
              Text(mood.name)
                .font(.headline)
              Text(mood.feeling)
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          }
        }
      }
      .navigationTitle("How do you feel?")
      .toolbar {
        NavigationLink("About") {
          AboutView()
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
