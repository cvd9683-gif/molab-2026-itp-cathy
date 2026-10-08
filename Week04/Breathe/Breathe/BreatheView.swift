//
//  BreatheView.swift
//  Breathe
//

import SwiftUI
import AVFoundation

// Create an audio player for a file stored in the app bundle
// (same as loadBundleAudio in 04-Audio-State-Demo)
func loadBundleAudio(_ fileName: String) -> AVAudioPlayer? {
  let path = Bundle.main.path(forResource: fileName, ofType: nil)!
  let url = URL(fileURLWithPath: path)
  do {
    return try AVAudioPlayer(contentsOf: url)
  } catch {
    print("loadBundleAudio error", error)
  }
  return nil
}

// Page 2: a circle that grows and shrinks with your breath
struct BreatheView: View {
  var pattern: Pattern

  @State private var isRunning = false
  @State private var phaseIndex = 0
  @State private var secondsLeft = 0
  @State private var rounds = 0
  @State private var player: AVAudioPlayer? = nil

  // Timer gets called every second (like CountDownTimerView)
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

  var phase: Phase {
    pattern.phases[phaseIndex]
  }

  var circleSize: Double {
    isRunning ? phase.size : exhale
  }

  var body: some View {
    VStack(spacing: 24) {
      Spacer()

      ZStack {
        Circle()
          .fill(pattern.color.opacity(0.25))
          .scaleEffect(circleSize)
          // grow or shrink over the whole length of the phase
          .animation(.easeInOut(duration: Double(phase.seconds)), value: circleSize)
        VStack {
          Text(isRunning ? phase.name : "Ready")
            .font(.title)
          if isRunning {
            Text("\(secondsLeft)")
              .font(.system(size: 60))
              .monospacedDigit()
          }
        }
      }
      .frame(width: 300, height: 300)

      Text("Rounds: \(rounds)")
        .foregroundStyle(.secondary)

      Spacer()

      Button(isRunning ? "Stop" : "Start") {
        if isRunning {
          stop()
        } else {
          start()
        }
      }
      .font(.title2)
      .buttonStyle(.borderedProminent)
      .tint(pattern.color)
      .padding(.bottom, 40)
    }
    .navigationTitle("\(pattern.emoji) \(pattern.name)")
    .navigationBarTitleDisplayMode(.inline)
    .onReceive(timer) { _ in
      if !isRunning { return }
      secondsLeft -= 1
      if secondsLeft <= 0 {
        nextPhase()
      }
    }
    .onDisappear {
      stop()
    }
  }

  func start() {
    rounds = 0
    phaseIndex = 0
    secondsLeft = phase.seconds
    isRunning = true
    playSound()
  }

  func stop() {
    isRunning = false
    player?.stop()
  }

  // Move to the next phase, wrapping back to the first one
  func nextPhase() {
    phaseIndex = (phaseIndex + 1) % pattern.phases.count
    if phaseIndex == 0 {
      rounds += 1
    }
    secondsLeft = phase.seconds
    playSound()
  }

  func playSound() {
    player = loadBundleAudio(phase.sound)
    player?.play()
  }
}

#Preview {
  NavigationStack {
    BreatheView(pattern: patterns[0])
  }
}
