//
// AppStorageView.swift
// from 05-AppStorageDemo
//
// Using @AppStorage property wrapper for simple user data
// Values are saved on the device, so they are still there after the app quits

import SwiftUI

struct AppStorageView: View {
    @AppStorage("username") var username: String = "friend"
    @AppStorage("score") var score: Int = 0

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Text("Welcome, \(username)")
                .font(.title)
            // type your own name: it's saved as you type
            TextField("Your name", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 40)
            HStack {
                Button("Log in") {
                    username = "someone"
                }
                Button("Log out") {
                    username = "Anonymous"
                }
            }
            Text("Score \(score)")
                .font(.title2)
            HStack {
                Button("+ Score") {
                    score += 1
                }
                Button("- Score") {
                    score -= 1
                }
            }
            Spacer()
        }
        .navigationTitle("AppStorage")
    }
}

#Preview {
    AppStorageView()
}
