import SwiftUI

struct SearchView: View {
    @EnvironmentObject var manager: SourceManager
    @State private var query = ""

    var filteredApps: [SidestoreApp] {
        if query.isEmpty { return manager.allApps }
        return manager.allApps.filter { $0.name.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        NavigationStack {
            List(filteredApps) { app in
                VStack(alignment: .leading) {
                    Text(app.name).font(.headline)
                    if let dev = app.developerName {
                        Text(dev).font(.subheadline).foregroundColor(.secondary)
                    }
                }
            }
            .searchable(text: $query)
            .navigationTitle("Search")
        }
    }
}
