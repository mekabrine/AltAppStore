import Foundation

struct SidestoreApp: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let developerName: String?
    let version: String?
    let iconURL: URL?
    let downloadURL: URL?
}
