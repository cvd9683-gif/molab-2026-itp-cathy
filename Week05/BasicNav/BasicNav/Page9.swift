//
// NavigationView for pages

import SwiftUI

struct Page9: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Page1()
                } label: {
                    Text("Page1")
                }
                NavigationLink {
                    Page2()
                } label: {
                    Text("Page2")
                }
                NavigationLink {
                    Page3()
                } label: {
                    Text("Page3")
                }
                NavigationLink {
                    Page4()
                } label: {
                    Text("Page4")
                }
                NavigationLink {
                    Page5()
                } label: {
                    Text("Page5")
                }
                NavigationLink {
                    Page6()
                } label: {
                    Text("Page6")
                }
                NavigationLink {
                    Page7()
                } label: {
                    Text("Page7")
                }
                NavigationLink {
                    Page8()
                } label: {
                    Text("Page8")
                }
                // from 03-UIGraphics-View
                NavigationLink {
                    UIGraphicsView()
                } label: {
                    Text("UIGraphicsView")
                }
                // from 04-Audio-State-Demo
                NavigationLink {
                    PlayAudioView()
                } label: {
                    Text("PlayAudioView")
                }
            }
            // inside NavigationView so the title shows
            .navigationTitle("BasicNav")
        }
    }
}

#Preview {
    Page9()
}

