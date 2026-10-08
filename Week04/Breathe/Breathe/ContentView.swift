//
//  ContentView.swift
//  Breathe
//

import SwiftUI

// Page 1: pick a breathing pattern
struct ContentView: View {
  var body: some View {
    NavigationStack {
      List(patterns) { pattern in
        NavigationLink {
          BreatheView(pattern: pattern)
        } label: {
          HStack {
            Text(pattern.emoji)
              .font(.largeTitle)
            VStack(alignment: .leading) {
              Text(pattern.name)
                .font(.headline)
              Text(pattern.about)
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          }
        }
      }
      .navigationTitle("Breathe")
    }
  }
}

#Preview {
  ContentView()
}
