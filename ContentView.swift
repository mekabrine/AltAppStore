import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CoolShitView()
                .tabItem {
                    Label("Cool Sh*t", systemImage: "sparkles")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            SourcesView()
                .tabItem {
                    Label("Sources", systemImage: "tray.full")
                }
        }
    }
}
