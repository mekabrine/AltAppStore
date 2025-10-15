import SwiftUI

struct AddSourceView: View {
    @EnvironmentObject var manager: SourceManager
    @Environment(\.dismiss) var dismiss

    @State private var url = ""
    @State private var name = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("Add Source")
                .font(.title2).bold()

            TextField("Repository Name (optional)", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            TextField("Add APT URL", text: $url)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.bordered)
                .tint(.gray)

                Button("Add Source") {
                    manager.addSource(name: name, url: url)
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
