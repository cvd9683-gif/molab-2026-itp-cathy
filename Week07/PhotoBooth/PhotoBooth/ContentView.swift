//
//  ContentView.swift
//  PhotoBooth
//

import SwiftUI
import PhotosUI
import UIKit
import CoreImage.CIFilterBuiltins

struct ContentView: View {
  @State private var selectedPhoto: PhotosPickerItem?
  @State private var originalImage: UIImage?
  @State private var filteredImage: UIImage?
  @State private var selectedFilter = "Original"
  @State private var isLoading = false
  @State private var message = ""

  let filters = ["Original", "Comic", "Pixelated", "Bulge"]
  let context = CIContext()

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 20) {
          Text("Make a silly version of a photo.")
            .foregroundStyle(.secondary)

          if let filteredImage {
            Image(uiImage: filteredImage)
              .resizable()
              .scaledToFit()
              .frame(maxHeight: 400)
              .accessibilityLabel("Photo with \(selectedFilter) selected")
          } else {
            Text("Choose a photo to start.")
              .frame(maxWidth: .infinity, minHeight: 220)
              .background(Color.gray.opacity(0.1))
          }

          PhotosPicker(selection: $selectedPhoto, matching: .images) {
            Label("Choose a photo", systemImage: "photo")
          }
          .buttonStyle(.borderedProminent)

          if isLoading {
            ProgressView("Loading photo…")
          }

          Picker("Filter", selection: $selectedFilter) {
            ForEach(filters, id: \.self) { filter in
              Text(filter).tag(filter)
            }
          }
          .pickerStyle(.menu)
          .disabled(originalImage == nil || isLoading)

          if !message.isEmpty {
            Text(message)
              .foregroundStyle(.secondary)
          }
        }
        .padding()
      }
      .navigationTitle("PhotoBooth")
      // A new selection cancels the previous loading task.
      .task(id: selectedPhoto) {
        await loadPhoto()
      }
      .onChange(of: selectedFilter) {
        applyFilter()
      }
    }
  }

  @MainActor
  func loadPhoto() async {
    guard let selectedPhoto else { return }
    isLoading = true
    message = ""
    originalImage = nil
    filteredImage = nil
    selectedFilter = "Original"

    do {
      // await gives the photo library time to fetch the selected photo.
      let data = try await selectedPhoto.loadTransferable(type: Data.self)
      guard !Task.isCancelled else { return }
      if let data, let image = UIImage(data: data) {
        // Draw an upright, smaller copy so the filters have less work to do.
        let scale = min(1, 1200 / max(image.size.width, image.size.height))
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        let preview = renderer.image { _ in
          image.draw(in: CGRect(origin: .zero, size: size))
        }
        originalImage = preview
        filteredImage = preview
      } else {
        message = "This photo could not be opened. Please choose another one."
      }
    } catch {
      guard !Task.isCancelled else { return }
      message = "The photo could not be loaded. Please try again."
    }
    isLoading = false
  }

  func applyFilter() {
    guard let originalImage else { return }
    message = ""
    if selectedFilter == "Original" {
      filteredImage = originalImage
      return
    }
    guard let input = CIImage(image: originalImage) else {
      filteredImage = nil
      message = "This photo could not be filtered. Try Original or another photo."
      return
    }

    // Always start with the original, so effects do not pile up.
    let output: CIImage?
    switch selectedFilter {
    case "Comic":
      let filter = CIFilter.comicEffect()
      filter.inputImage = input
      output = filter.outputImage
    case "Pixelated":
      let filter = CIFilter.pixellate()
      filter.inputImage = input
      filter.scale = Float(max(input.extent.width, input.extent.height) / 35)
      output = filter.outputImage
    case "Bulge":
      let filter = CIFilter.bumpDistortion()
      filter.inputImage = input
      filter.center = CGPoint(x: input.extent.midX, y: input.extent.midY)
      filter.radius = Float(min(input.extent.width, input.extent.height) * 0.4)
      filter.scale = 0.7
      output = filter.outputImage
    default:
      output = input
    }

    // Crop to the photo's bounds, then render pixels SwiftUI can display.
    if let output, let result = context.createCGImage(output, from: input.extent) {
      filteredImage = UIImage(cgImage: result)
    } else {
      filteredImage = nil
      message = "This filter could not be shown. Try Original or another filter."
    }
  }
}

#Preview {
  ContentView()
}
