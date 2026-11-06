# Week 07

## PhotoBooth: three silly ways to see a photo

[`PhotoBooth`](./PhotoBooth) is a small SwiftUI photo booth. Choose a photo with PhotosUI, then switch between Original, Comic, Pixelated, and Bulge. Original shows the unfiltered preview; Bulge makes the middle of the photo balloon outward. The UI is one screen with a photo, a button, and a filter menu.

## Open and try it

1. On a Mac with Xcode 16 or newer, open `PhotoBooth/PhotoBooth.xcodeproj`.
2. Select the PhotoBooth scheme and an iPhone simulator running iOS 17 or newer. Press **Cmd-R**. For a physical iPhone, select your own signing team in Signing & Capabilities first; no team is stored in this project.
3. Have at least one photo in the simulator's Photos library (drag a photo into the simulator if needed). Tap **Choose a photo** and select it.
4. Try all four menu choices. Return to Original and check that the effects do not accumulate. Try a portrait and a landscape photo, including a rotated phone photo; check that they stay upright and fit the preview.
5. Choose a different photo and check that the menu resets to Original. Cancel the picker and check that the current preview stays. Try changing photos quickly while one loads; the latest selection should win.
6. If possible, try an iCloud-only photo with and without network access. A failed load should show a message, and choosing another photo should recover. Close and reopen the app: it starts empty.

These are manual checks to perform, not claims of completed testing. No screenshots or simulator/device results are included.

## Code walkthrough

- [`PhotoBoothApp.swift`](./PhotoBooth/PhotoBooth/PhotoBoothApp.swift) opens `ContentView`, like the app entry points in earlier weeks.
- [`ContentView.swift`](./PhotoBooth/PhotoBooth/ContentView.swift) keeps the selected photo, original preview, displayed preview, menu choice, loading flag, and message in `@State`. Changing state updates the screen. The filter names are a small array used by `ForEach`, like the controls in Week05.
- `PhotosPicker` asks for one image. `.task(id: selectedPhoto)` starts loading when the selection changes and cancels the previous task. `await loadTransferable` waits for the library to supply the data; a cancellation check keeps an older load from replacing a newer choice. `@MainActor` keeps loading-related UI changes on the main actor.
- `loadPhoto()` converts the data into a `UIImage`. `UIGraphicsImageRenderer`, also used in Week05, draws an upright preview at most 1200 pixels on its longest side. Both Original and the filters use that same smaller copy.
- `.onChange` calls `applyFilter()` when the menu changes. A `switch` creates one built-in Core Image filter. Comic outlines the picture, Pixelated uses chunky squares, and Bulge distorts a circle around the center. Each starts from `originalImage`.
- Core Image describes the result as a `CIImage`. `CIContext.createCGImage` renders it within the original bounds, and `Image(uiImage:)` displays it in SwiftUI. Failed loading or rendering shows a short message instead of force-unwrapping a missing image.
- The Xcode project follows Week06's folder layout and synchronized source group, with generated app information and a deployment target of iOS 17. It uses only Apple's frameworks.

## Verification and limitations

Implementation took place in Linux. `swift`, `xcodebuild`, and `plutil` were unavailable, so Swift compilation, Xcode builds, previews, and simulator/device testing were **not performed**. Static checks covered asset JSON, project syntax and object references, project/source paths, local Markdown links, whitespace, and change scope. The final working-tree diff was inspected. These checks cannot verify Apple SDK types or runtime behavior; the manual checks above still need a Mac and Xcode.

Photos are kept in memory only. There is no camera capture, save, share, persistence, face detection, or adjustable filter strength. The system picker supplies only the selected image; the app does not request broad photo-library access or alter the library. iCloud downloads may need a network connection. Large photos are loaded before resizing, and resizing/filter rendering happens on the UI thread, so loading and filter changes may pause on slower devices. Original is a resized preview, not the full-resolution file. Bulge always targets the center, which may miss a face. Animated photos are treated as still images. The app icon catalog is a placeholder without artwork, matching the earlier projects.

## Class and AI attribution

This project addresses the photo app portion of the [Week07 course assignment](https://github.com/molab-itp/content-2026-itp/blob/main/weeks/07_photo.md). [07-Instafilter](https://github.com/molab-itp/07-Instafilter) was consulted as a learning reference for PhotosUI and Core Image, rather than copied as an app. Apple's [photo loading documentation](https://developer.apple.com/documentation/photosui/photospickeritem/loadtransferable(type:)) and [Core Image filter reference](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html) informed the API use.

OpenAI Codex implemented the code and this documentation at Cathy Doss's request, using her Week03–Week06 projects as style references and Week06's Xcode project settings as a template. This README records the implementation and its limits; it does not represent Cathy's personal reflection or a claim that she ran the app. Class wiki updates, hardware checklist work, and later assignments are outside this change.
