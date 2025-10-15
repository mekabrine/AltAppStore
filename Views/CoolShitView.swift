import SwiftUI

struct CoolShitView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Cool Sh*t")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                Text("Discover trending apps and sources.")
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Cool Sh*t")
        }
    }
}
