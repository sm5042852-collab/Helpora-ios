import SwiftUI

struct TrustCenterView: View {
    var body: some View {
        List {
            Section("Your safety") {
                Label("Community guidelines", systemImage: "checkmark.shield.fill")
                Label("Report a problem", systemImage: "exclamationmark.bubble.fill")
                Label("Block and privacy controls", systemImage: "hand.raised.fill")
            }
            Section("Trust") {
                Label("Verification status", systemImage: "person.badge.shield.checkmark")
                Label("Safety tips", systemImage: "lightbulb.fill")
            }
        }
        .navigationTitle("Trust Center")
    }
}
