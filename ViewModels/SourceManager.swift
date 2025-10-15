import Foundation

struct RepoSource: Identifiable, Codable, Hashable {
    let id = UUID()
    let name: String
    let url: String
    let packageCount: Int
}

class SourceManager: ObservableObject {
    @Published var sources: [RepoSource] = [
        RepoSource(name: "CyPwn Repo 🔥", url: "https://repo.cypwn.xyz", packageCount: 51),
        RepoSource(name: "A Check0ver ™", url: "https://check0ver.com/", packageCount: 2),
        RepoSource(name: "BigBoss", url: "http://apt.thebigboss.org/repofiles/cydia/", packageCount: 9)
    ]

    func addSource(name: String, url: String) {
        let new = RepoSource(name: name.isEmpty ? "Untitled Repo" : name,
                             url: url, packageCount: Int.random(in: 0...100))
        sources.append(new)
    }
}
