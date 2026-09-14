import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var helpStore: HelpRequestStore
    @EnvironmentObject private var profileStore: ProfileStore
    @EnvironmentObject private var notificationStore: NotificationStore
    @State private var showingCreateHelp = false

    var openRequests: Int { helpStore.requests.filter { !$0.isResolved }.count }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(profileStore.profile.displayName.isEmpty ? "Together we are stronger." : "Hello, \(profileStore.profile.displayName)")
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
                        CommunityCard(icon: "heart.fill", title: "Open requests", value: "\(openRequests)")
                        CommunityCard(icon: "person.2.fill", title: "Your HP points", value: "\(profileStore.profile.hpPoints)")
                        CommunityCard(icon: "checkmark.shield.fill", title: "Safety first", value: "Trust Center")
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Quick actions").font(.title2.bold())
                        NavigationLink { NotificationsView() } label: {
                            Label("Notifications", systemImage: "bell.badge")
                        }
                        NavigationLink { TrustCenterView() } label: {
                            Label("Safety and trust", systemImage: "checkmark.shield.fill")
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("HELPORA")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        NotificationsView()
                    } label: {
                        Image(systemName: "bell")
                    }
                }
            }
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
