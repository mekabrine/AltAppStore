import SwiftUI

struct SourcesView: View {
    @EnvironmentObject var manager: SourceManager
    @State private var showingAdd = false
    @State private var newSource = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.sources, id: \.self) { source in
                    NavigationLink(destination: SourceDetailView(source: source)) {
                        Text(source.absoluteString)
                            .lineLimit(1)
                    }
                }
            }
            .navigationTitle("Sources")
            .toolbar {
                Button {
                    showingAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .alert("Add Source", isPresented: $showingAdd) {
                TextField("https://example.com/source.json", text: $newSource)
                Button("Add") {
                    manager.addSource(newSource)
                    newSource = ""
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
}
