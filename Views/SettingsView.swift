import SwiftUI

struct SettingsView: View {
    @AppStorage("helpora.notifications") private var notifications = true
    @AppStorage("helpora.nearby") private var nearby = false
    @AppStorage("helpora.language") private var language = "English"

    var body: some View {
        Form {
            Section("Preferences") {
                Picker("Language", selection: $language) {
                    Text("English").tag("English")
                    Text("Türkçe").tag("Türkçe")
                    Text("Deutsch").tag("Deutsch")
                    Text("Kurdî").tag("Kurdî")
                    Text("العربية").tag("العربية")
                    Text("Русский").tag("Русский")
                    Text("Українська").tag("Українська")
                    Text("Română").tag("Română")
                    Text("Shqip").tag("Shqip")
                }
                Toggle("Notifications", isOn: $notifications)
                Toggle("Nearby community", isOn: $nearby)
            }
            Section("Legal") {
                Label("Privacy", systemImage: "hand.raised")
                Label("Terms & Conditions", systemImage: "doc.text")
            }
            Section("About") {
                LabeledContent("Version", value: "0.1")
                LabeledContent("Build", value: "Development")
            }
        }
        .navigationTitle("Settings")
    }
}
