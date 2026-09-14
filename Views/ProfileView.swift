import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Label("Welat", systemImage: "person.crop.circle.fill")
                }
                Section("HELPORA") {
                    Label("Trust Center", systemImage: "checkmark.shield")
                    Label("HP Points", systemImage: "star.fill")
                    Label("Settings", systemImage: "gear")
                }
            }.navigationTitle("Profile")
        }
    }
}
