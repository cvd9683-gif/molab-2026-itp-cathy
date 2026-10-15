//
//  PageModel.swift
//  MoodJournal
//
//  The Router from 06-Router: one @Observable class holds which page is showing.
//  Any view can change the page by setting pageModel.pageTag.
//

import SwiftUI

@Observable
class PageModel {
  var pageTag: PageEnum = .today
}

enum PageEnum: CaseIterable {
  case today
  case journal
  case pattern

  var title: String {
    switch self {
    case .today: "Today"
    case .journal: "Journal"
    case .pattern: "Pattern"
    }
  }

  var symbol: String {
    switch self {
    case .today: "sun.horizon"
    case .journal: "book"
    case .pattern: "circle.grid.3x3"
    }
  }
}
