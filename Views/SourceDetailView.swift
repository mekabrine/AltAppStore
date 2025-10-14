import SwiftUI

struct SourceDetailView: View {
    let source: URL

    var body: some View {
        VStack {
            Text(source.absoluteString)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .navigationTitle("Source")
        .navigationBarTitleDisplayMode(.inline)
    }
}
