//
//  MovieFile.swift
//  VideoBooth
//
//  PhotosPicker hands us a video, but the file it points at lives in a
//  system folder that can go away. This little type copies the video into
//  our own temporary file and gives back its URL, which AVPlayer can play.
//
//  "Transferable" is the protocol SwiftUI uses to move files and data in and
//  out of things like PhotosPicker. We only need it for importing.
//

import SwiftUI
import UniformTypeIdentifiers

struct MovieFile: Transferable {
  let url: URL

  static var transferRepresentation: some TransferRepresentation {
    FileRepresentation(contentType: .movie) { movie in
      SentTransferredFile(movie.url)
    } importing: { received in
      // Make our own copy so the clip is still there after the picker closes.
      let copy = URL.temporaryDirectory
        .appending(path: "booth-\(UUID().uuidString).mov")
      try? FileManager.default.removeItem(at: copy)
      try FileManager.default.copyItem(at: received.file, to: copy)
      return MovieFile(url: copy)
    }
  }
}
