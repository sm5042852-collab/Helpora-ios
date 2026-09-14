import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("HELPORA").font(.largeTitle.bold())
                    Text("Together we are stronger.").font(.title3)
                    Text("Hann. Münden • Community • Help")
                        .foregroundStyle(.secondary)
                    Button("Ask for Help") { }
                        .buttonStyle(.borderedProminent)
                }.padding()
            }.navigationTitle("Home")
        }
    }
}
