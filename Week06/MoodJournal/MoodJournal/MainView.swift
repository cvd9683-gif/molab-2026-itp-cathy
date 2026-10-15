//
//  MainView.swift
//  MoodJournal
//
//  Replaces NavigationView: a switch on pageModel.pageTag picks the page,
//  and the buttons along the bottom change it.
//

import SwiftUI

struct MainView: View {
  @Environment(PageModel.self) var pageModel

  var body: some View {
    VStack(spacing: 0) {
      Text(pageModel.pageTag.title)
        .font(.largeTitle.bold())
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

      switch pageModel.pageTag {
      case .today:
        TodayView()
      case .journal:
        JournalView()
      case .pattern:
        PatternView()
      }

      Spacer(minLength: 0)
      Divider()
      PageBar()
    }
  }
}

// One button per page, highlighted when it's the current page
struct PageBar: View {
  @Environment(PageModel.self) var pageModel

  var body: some View {
    HStack {
      ForEach(PageEnum.allCases, id: \.self) { page in
        Button {
          pageModel.pageTag = page
        } label: {
          VStack(spacing: 4) {
            Image(systemName: page.symbol)
              .font(.title2)
            Text(page.title)
              .font(.caption)
          }
          .frame(maxWidth: .infinity)
          .foregroundStyle(pageModel.pageTag == page ? Color.accentColor : .secondary)
        }
      }
    }
    .padding(.top, 8)
  }
}

#Preview {
  MainView()
    .environment(PageModel())
    .environment(Journal())
}
