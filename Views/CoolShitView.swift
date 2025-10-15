import SwiftUI

struct CoolShitView: View {
    struct FeatureCard: Identifiable {
        let id = UUID()
        let title: String
        let subtitle: String
        let image: String
    }

    let features = [
        FeatureCard(title: "Explore Toca Boca World", subtitle: "Create & Explore Your Story!", image: "feature1"),
        FeatureCard(title: "Now Available", subtitle: "Discover creative new apps.", image: "feature2")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Today")
                        .font(.largeTitle).bold()
                        .padding(.horizontal)

                    ForEach(features) { item in
                        VStack(alignment: .leading) {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 220)
                                .clipped()
                                .cornerRadius(18)
                                .padding(.horizontal)

                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Cool Sh*t")
        }
    }
}
