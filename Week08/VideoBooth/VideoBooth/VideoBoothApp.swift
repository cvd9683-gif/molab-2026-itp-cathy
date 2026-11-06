//
//  VideoBoothApp.swift
//  VideoBooth
//
//  Week08 — video. A tiny "video booth": pick a short clip from your
//  photos and give it a funny visual effect, like a photo booth but moving.
//  Learned from the class examples 08-FilterTheWorld (Core Image filters)
//  and 08-CameraRecorder (AVFoundation video).
//

import SwiftUI

@main
struct VideoBoothApp: App {
  var body: some Scene {
    WindowGroup {
      BoothView()
    }
  }
}
