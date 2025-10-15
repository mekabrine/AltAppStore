import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().tintColor = UIColor.systemPurple
    }

    var body: some View {
        TabView {
            CoolShitView()
                .tabItem {
                    Label("Cool Sh*t", systemImage: "star.fill")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            SourcesView()
                .tabItem {
                    Label("Sources", systemImage: "list.bullet.rectangle.portrait")
                }
        }
        .accentColor(.purple)
    }
}
