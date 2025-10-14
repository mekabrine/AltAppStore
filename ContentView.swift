import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: SourceManager

    var body: some View {
        TabView {
            CoolShitView()
                .tabItem {
                    Label("Cool Sh*t", systemImage: "flame.fill")
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
        .task {
            await manager.loadAllApps()
        }
    }
}
