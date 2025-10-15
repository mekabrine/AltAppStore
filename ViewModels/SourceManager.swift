import Foundation

class SourceManager: ObservableObject {
    @Published var sources: [SidestoreSource] = []

    private let sourceURL = URL(string: "https://ios.mekabrine.space/altappstore")!

    func fetchSources() {
        URLSession.shared.dataTask(with: sourceURL) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let decoded = try JSONDecoder().decode([SidestoreSource].self, from: data)
                DispatchQueue.main.async {
                    self.sources = decoded
                }
            } catch {
                print("❌ Failed to decode sources:", error)
            }
        }.resume()
    }
}
