import SwiftUI

struct SourcesView: View {
    @EnvironmentObject var manager: SourceManager
    @State private var showingAddSheet = false

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Repositories")) {
                    ForEach(manager.sources) { repo in
                        VStack(alignment: .leading) {
                            Text(repo.name)
                                .font(.headline)
                            Text(repo.url)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Sources")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.purple)
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddSourceView()
                    .environmentObject(manager)
                    .presentationDetents([.fraction(0.35)])
            }
        }
    }
}
