import Foundation

@MainActor
class SourceManager: ObservableObject {
    @Published var sources: [URL] = [
        URL(string: "https://ios.mekabrine.space/altappstore")!
    ]
    @Published var allApps: [SidestoreApp] = []

    func loadAllApps() async {
        var fetchedApps: [SidestoreApp] = []

        for source in sources {
            do {
                let (data, _) = try await URLSession.shared.data(from: source)
                let decoded = try JSONDecoder().decode([SidestoreApp].self, from: data)
                fetchedApps.append(contentsOf: decoded)
            } catch {
                print("Failed to load from \(source): \(error)")
            }
        }
        allApps = fetchedApps
    }

    func addSource(_ urlString: String) {
        if let url = URL(string: urlString),
           !sources.contains(url) {
            sources.append(url)
        }
    }
}
