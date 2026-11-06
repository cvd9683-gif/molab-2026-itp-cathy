//
//  BoothView.swift
//  VideoBooth
//
//  The whole app is this one screen:
//   - before you pick a clip: a big button to choose one from your photos
//   - after: the video playing, plus a row of effect buttons and a way to
//     swap in a different clip.
//

import SwiftUI
import AVKit
import PhotosUI

struct BoothView: View {
  @State private var model = BoothModel()
  @State private var picked: PhotosPickerItem?

  var body: some View {
    VStack(spacing: 0) {
      Text("Video Booth")
        .font(.largeTitle.bold())
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

      if let player = model.player {
        VideoPlayer(player: player)
          .frame(height: 360)
          .background(Color.black)

        EffectBar(model: model)

        // Swap in a different clip.
        PhotosPicker(selection: $picked, matching: .videos) {
          Label("Choose another clip", systemImage: "photo.on.rectangle")
        }
        .padding()

        Spacer(minLength: 0)
      } else {
        // Empty state: nothing picked yet.
        Spacer()
        VStack(spacing: 16) {
          Image(systemName: "film.stack")
            .font(.system(size: 64))
            .foregroundStyle(.secondary)
          Text("Pick a short video and give it a funny effect.")
            .font(.title3)
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)
          PhotosPicker(selection: $picked, matching: .videos) {
            Label("Choose a clip", systemImage: "photo.on.rectangle")
          }
          .buttonStyle(.borderedProminent)
        }
        .padding()
        Spacer()
      }
    }
    // When you pick something, copy it out and load it into the player.
    .onChange(of: picked) {
      guard let picked else { return }
      Task {
        if let movie = try? await picked.loadTransferable(type: MovieFile.self) {
          model.load(url: movie.url)
        }
      }
    }
  }
}

// One button per effect, highlighted when it's the current one.
// Same idea as the PageBar in Week06's MainView.
struct EffectBar: View {
  let model: BoothModel

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 12) {
        ForEach(Effect.allCases) { effect in
          Button {
            model.apply(effect)
          } label: {
            VStack(spacing: 4) {
              Image(systemName: effect.symbol)
                .font(.title2)
              Text(effect.label)
                .font(.caption)
            }
            .frame(width: 72)
            .padding(.vertical, 8)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(Color.accentColor.opacity(model.effect == effect ? 0.25 : 0.08))
            )
            .foregroundStyle(model.effect == effect ? Color.accentColor : .secondary)
          }
        }
      }
      .padding(.horizontal)
    }
    .padding(.top, 12)
  }
}

#Preview {
  BoothView()
}
