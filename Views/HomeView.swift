import SwiftUI

struct HomeView: View {
    @State private var showingCreateHelp = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Together we are stronger.")
                            .font(.largeTitle.bold())
                        Text("Find help, offer support and build a safer community.")
                            .foregroundStyle(.secondary)
                    }

                    Button {
                        showingCreateHelp = true
                    } label: {
                        Label("Ask for help", systemImage: "plus.circle.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Community today").font(.title2.bold())
                        CommunityCard(icon: "heart.fill", title: "Help requests", value: "0")
                        CommunityCard(icon: "person.2.fill", title: "People nearby", value: "Growing")
                        CommunityCard(icon: "checkmark.shield.fill", title: "Safety first", value: "Verified tools")
                    }
                }
                .padding()
            }
            .navigationTitle("HELPORA")
            .sheet(isPresented: $showingCreateHelp) {
                CreateHelpView()
            }
        }
    }
}

private struct CommunityCard: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title3)
                .frame(width: 36)
            Text(title)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}
