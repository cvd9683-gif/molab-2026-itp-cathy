//
// Check-in, from 05-AppStorageDemo
// @AppStorage saves a value in UserDefaults, so it is still there
// after the app quits and opens again.
// Page9 reads the same "name" key, so both views share one source of truth.

import SwiftUI

let feelings = ["🌊 calm", "🌼 joyful", "⚡️ anxious", "🌙 tired"]

struct CheckInView: View {
    @AppStorage("name") var name: String = ""
    @AppStorage("feeling") var feeling: String = ""
    @AppStorage("visits") var visits: Int = 0
    // AppStorage can't store a Date, so store seconds since 1970 instead
    @AppStorage("lastVisit") var lastVisit: Double = 0

    // What was saved before this visit, so we can talk about "last time"
    @State private var lastFeeling = ""
    @State private var lastTime: Double = 0

    var body: some View {
        Form {
            Section("Who's here?") {
                TextField("Your name", text: $name)
            }
            Section {
                Text(name.isEmpty ? "Welcome" : "Welcome back, \(name)")
                    .font(.title2)
                Text("Visit #\(visits)")
                if lastTime > 0 {
                    Text("Last visit \(Date(timeIntervalSince1970: lastTime), style: .relative) ago")
                    if !lastFeeling.isEmpty {
                        Text("You arrived feeling \(lastFeeling)")
                    }
                }
            }
            Section("How are you arriving today?") {
                ForEach(feelings, id: \.self) { f in
                    Button {
                        feeling = f
                    } label: {
                        HStack {
                            Text(f)
                            Spacer()
                            if feeling == f {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            Section {
                Button("Forget me", role: .destructive) {
                    name = ""
                    feeling = ""
                    visits = 0
                    lastVisit = 0
                    lastFeeling = ""
                    lastTime = 0
                }
            }
        }
        .navigationTitle("Check-in")
        .onAppear {
            // Remember the old values first, then record this visit
            lastFeeling = feeling
            lastTime = lastVisit
            visits += 1
            lastVisit = Date().timeIntervalSince1970
        }
    }
}

#Preview {
    NavigationView {
        CheckInView()
    }
}
