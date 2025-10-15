import SwiftUI

struct SourceDetailView: View {
    let app: SidestoreApp

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let iconURL = app.iconURL {
                    AsyncImage(url: iconURL) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(.top)
                }

                Text(app.name)
                    .font(.largeTitle)
                    .bold()

                if let dev = app.developerName {
                    Text(dev)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }

                if let version = app.version {
                    Text("Version \(version)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                if let url = app.downloadURL {
                    Link("Download", destination: url)
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .padding()
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(app.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
