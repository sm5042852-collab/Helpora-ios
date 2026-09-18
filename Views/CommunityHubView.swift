import SwiftUI

struct CommunityHubView: View {
    var body: some View {
        List {
            NavigationLink { VolunteerView() } label: {
                Label("Volunteer", systemImage: "hands.sparkles.fill")
            }
            NavigationLink { SafetyToolsView() } label: {
                Label("Safety tools", systemImage: "shield.fill")
            }
        }
        .navigationTitle("Community Hub")
    }
}
