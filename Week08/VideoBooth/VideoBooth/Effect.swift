//
//  Effect.swift
//  VideoBooth
//
//  The funny effects you can put on your clip. Like the Mood enum in Week06,
//  this is an enum that looks up its own name, symbol, and — the new part —
//  a Core Image filter.
//
//  Each case either has no filter (the original clip) or the name of a
//  built-in Core Image filter. 08-FilterTheWorld used CIFilter on the live
//  camera; here the same filters run on every frame of a chosen video.
//

import AVFoundation
import CoreImage

enum Effect: String, CaseIterable, Identifiable {
  case none
  case comic
  case noir
  case thermal
  case xray
  case invert

  var id: String { rawValue }

  // What the button says.
  var label: String {
    switch self {
    case .none: "Original"
    case .comic: "Comic"
    case .noir: "Noir"
    case .thermal: "Thermal"
    case .xray: "X-Ray"
    case .invert: "Invert"
    }
  }

  // A small SF Symbol for the button.
  var symbol: String {
    switch self {
    case .none: "film"
    case .comic: "face.smiling"
    case .noir: "moon.stars"
    case .thermal: "flame"
    case .xray: "waveform"
    case .invert: "circle.lefthalf.filled"
    }
  }

  // The Core Image filter name, or nil to leave the clip alone.
  // These six filters all work on just an input image, so there are no
  // extra settings to pass in — nice and simple.
  var ciFilterName: String? {
    switch self {
    case .none: nil
    case .comic: "CIComicEffect"
    case .noir: "CIPhotoEffectNoir"
    case .thermal: "CIThermal"
    case .xray: "CIXRay"
    case .invert: "CIColorInvert"
    }
  }

  // Build the "video composition" that plays the clip with this effect.
  // A video composition is Apple's way of saying "run this code on every
  // frame before showing it." For .none there's no filter, so we return nil
  // and the clip plays untouched.
  func videoComposition(for asset: AVAsset) -> AVVideoComposition? {
    guard let name = ciFilterName, let filter = CIFilter(name: name) else {
      return nil
    }

    return AVVideoComposition(asset: asset) { request in
      // request.sourceImage is the current frame as a Core Image image.
      // clampedToExtent stretches the edges so filters that blur or shift
      // pixels don't leave a transparent border.
      let frame = request.sourceImage.clampedToExtent()
      filter.setValue(frame, forKey: kCIInputImageKey)

      // Hand the filtered frame back, cropped to the original size.
      let output = (filter.outputImage ?? request.sourceImage)
        .cropped(to: request.sourceImage.extent)
      request.finish(with: output, context: nil)
    }
  }
}
