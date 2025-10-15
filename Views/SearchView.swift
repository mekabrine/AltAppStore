import SwiftUI

struct SearchView: View {
    @EnvironmentObject var manager: SourceManager
    @State private var query = ""

    var filteredApps: [SidestoreApp] {
        if query.isEmpty { return [] }
        return manager.sources.flatMap { $0.apps }
            .filter { $0.name.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        NavigationStack {
            List(filteredApps) { app in
                NavigationLink(destination: SourceDetailView(app: app)) {
                    Text(app.name)
                }
            }
            .searchable(text: $query, prompt: "Search apps")
            .navigationTitle("Search")
        }
    }
}
