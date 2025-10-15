import SwiftUI

struct SourcesView: View {
    @EnvironmentObject var manager: SourceManager

    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.sources) { source in
                    Section(header: Text(source.name)) {
                        ForEach(source.apps) { app in
                            NavigationLink(destination: SourceDetailView(app: app)) {
                                HStack {
                                    AsyncImage(url: app.iconURL) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: 40, height: 40)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))

                                    VStack(alignment: .leading) {
                                        Text(app.name)
                                            .font(.headline)
                                        if let dev = app.developerName {
                                            Text(dev)
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Sources")
            .onAppear {
                manager.fetchSources()
            }
        }
    }
}
