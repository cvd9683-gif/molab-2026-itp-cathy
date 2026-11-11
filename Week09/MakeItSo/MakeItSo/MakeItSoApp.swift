//
//  MakeItSoApp.swift
//  MakeItSo
//
//  Week09 — Firebase. My version of the MakeItSo tutorial by Peter Friese
//  (chapters 1–4: a simple reminders list, then storing it in Cloud Firestore).
//  https://peterfriese.github.io/MakeItSo/tutorials/makeitso/
//  Class copy: https://github.com/molab-itp/09-MakeItSo
//

import SwiftUI
import FirebaseCore

// Firebase has to be started once, when the app launches.
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    // FirebaseApp.configure() crashes if GoogleService-Info.plist is missing,
    // so only call it when the file is really in the app.
    if Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist") != nil {
      FirebaseApp.configure()
    } else {
      print("MakeItSo: no GoogleService-Info.plist, running without Firebase")
    }
    return true
  }
}

@main
struct MakeItSoApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationStack {
        RemindersListView()
          .navigationTitle("Reminders")
      }
    }
  }
}
