import SwiftUI

struct ProfileView: View {
    @AppStorage("helpora.onboardingComplete") private var onboardingComplete = false
    @EnvironmentObject private var profileStore: ProfileStore

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 14) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 52))
                            .foregroundStyle(.purple)
                        VStack(alignment: .leading) {
                            Text(profileStore.profile.displayName.isEmpty ? "Welcome to HELPORA" : profileStore.profile.displayName)
                                .font(.headline)
                            Text(profileStore.profile.city.isEmpty ? "Complete your profile" : profileStore.profile.city)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 6)
                }

                Section("Profile") {
                    NavigationLink { EditProfileView() } label: {
                        Label("Edit profile", systemImage: "person.crop.circle")
                    }
                    LabeledContent("HP Points", value: "\(profileStore.profile.hpPoints)")
                    if profileStore.profile.isVerified {
                        Label("Verified member", systemImage: "checkmark.seal.fill")
                    }
                }

                Section("Community") {
                    NavigationLink { TrustCenterView() } label: {
                        Label("Trust Center", systemImage: "checkmark.shield")
                    }
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
