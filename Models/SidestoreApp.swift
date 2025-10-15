import Foundation

struct SidestoreApp: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let bundleIdentifier: String
    let developerName: String?
    let version: String?
    let iconURL: URL?
    let downloadURL: URL?
}

struct SidestoreSource: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let apps: [SidestoreApp]
}
