import SwiftUI

struct ProfileView: View {
    @AppStorage("helpora.onboardingComplete") private var onboardingComplete = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 14) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 52))
                            .foregroundStyle(.purple)
                        VStack(alignment: .leading) {
                            Text("Welcome to HELPORA").font(.headline)
                            Text("Complete your profile soon").foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 6)
                }

                Section("Community") {
                    NavigationLink { TrustCenterView() } label: {
                        Label("Trust Center", systemImage: "checkmark.shield")
                    }
                    Label("HP Points", systemImage: "star.fill")
                    Label("My activity", systemImage: "clock.arrow.circlepath")
                    Label("Saved items", systemImage: "bookmark.fill")
                }

                Section("App") {
                    NavigationLink { SettingsView() } label: {
                        Label("Settings", systemImage: "gear")
                    }
                    Button("Show onboarding again") { onboardingComplete = false }
                }
            }
            .navigationTitle("Profile")
        }
    }
}
