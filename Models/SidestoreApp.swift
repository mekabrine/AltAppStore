import Foundation

struct SidestoreApp: Identifiable, Codable {
    let id: UUID = UUID()
    let name: String
    let bundleIdentifier: String
    let developerName: String?
    let version: String?
    let iconURL: String?
    let downloadURL: String?
    let localizedDescription: String?
}
