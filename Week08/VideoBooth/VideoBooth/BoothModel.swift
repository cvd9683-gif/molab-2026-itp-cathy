//
//  BoothModel.swift
//  VideoBooth
//
//  The one @Observable class for this app, like PageModel/Journal in Week06.
//  It holds the video player and which effect is on, and it knows how to
//  load a new clip and switch effects.
//

import SwiftUI
import AVKit

@Observable
class BoothModel {
  // nil until you pick a clip. The player is what VideoPlayer shows.
  var player: AVPlayer?
  var effect: Effect = .none

  // Kept so we can loop the clip when it reaches the end.
  private var loopObserver: NSObjectProtocol?

  // Start playing a freshly picked clip from the top, with no effect yet.
  func load(url: URL) {
    stopLooping()

    let player = AVPlayer(url: url)
    self.player = player
    effect = .none
    apply(.none)

    // When the clip ends, jump back to the start and keep playing — so it
    // loops in the booth instead of stopping on the last frame.
    loopObserver = NotificationCenter.default.addObserver(
      forName: .AVPlayerItemDidPlayToEndTime,
      object: player.currentItem,
      queue: .main
    ) { _ in
      player.seek(to: .zero)
      player.play()
    }

    player.play()
  }

  // Switch to a different effect on the clip that's already playing.
  func apply(_ effect: Effect) {
    self.effect = effect
    guard let item = player?.currentItem else { return }
    // Setting videoComposition changes what every frame looks like.
    item.videoComposition = effect.videoComposition(for: item.asset)
  }

  private func stopLooping() {
    if let loopObserver {
      NotificationCenter.default.removeObserver(loopObserver)
    }
    loopObserver = nil
  }
}
