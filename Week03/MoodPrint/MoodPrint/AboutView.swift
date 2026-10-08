//
//  AboutView.swift
//  MoodPrint
//

import SwiftUI

// View 3: a short note about the project
struct AboutView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("MoodPrint")
        .font(.largeTitle)
        .bold()
      Text("10print is a one-line program that draws a maze by randomly picking \"/\" or \"\\\" over and over.")
      Text("Here, your mood picks the colors, the line thickness, and how likely each slash is to lean forward. Every tap of Shuffle makes a new one.")
      Spacer()
    }
    .padding()
    .navigationTitle("About")
  }
}

#Preview {
  AboutView()
}
