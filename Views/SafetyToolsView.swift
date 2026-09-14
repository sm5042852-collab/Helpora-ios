import SwiftUI

struct SafetyToolsView: View {
    @State private var locationSharing = false
    @State private var safetyCheck = true

    var body: some View {
        Form {
            Section("Meeting safety") {
                Toggle("Safety check reminder", isOn: $safetyCheck)
                Toggle("Share location during confirmed meeting", isOn: $locationSharing)
                Label("Emergency guidance", systemImage: "exclamationmark.triangle.fill")
                Label("Trusted contact", systemImage: "person.crop.circle.badge.checkmark")
            }
            Section("Controls") {
                Label("Block user", systemImage: "hand.raised.fill")
                Label("Report user", systemImage: "exclamationmark.bubble.fill")
                Label("Privacy controls", systemImage: "lock.fill")
            }
        }
        .navigationTitle("Safety Tools")
    }
}
