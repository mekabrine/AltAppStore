import SwiftUI

struct CoolShitView: View {
    @EnvironmentObject var manager: SourceManager

    var body: some View {
        NavigationStack {
            List(manager.allApps) { app in
                HStack {
                    AsyncImage(url: URL(string: app.iconURL ?? "")) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text(app.name).font(.headline)
                        if let dev = app.developerName {
                            Text(dev).font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Cool Sh*t")
        }
    }
}
