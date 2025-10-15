import SwiftUI

struct SearchView: View {
    @State private var query = ""
    @State private var results: [String] = [
        "TestFlight", "Speedtest by Ookla", "Filza File Manager"
    ]

    var filtered: [String] {
        guard !query.isEmpty else { return results }
        return results.filter { $0.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        NavigationStack {
            List(filtered, id: \.self) { app in
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.purple.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(Image(systemName: "app.fill"))
                    Text(app)
                        .font(.headline)
                }
            }
            .searchable(text: $query, prompt: "Search apps or tools")
            .navigationTitle("Search")
        }
    }
}
