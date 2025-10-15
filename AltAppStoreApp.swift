import SwiftUI

@main
struct AltAppStoreApp: App {
    @StateObject private var manager = SourceManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
                .preferredColorScheme(.dark)
        }
    }
}
