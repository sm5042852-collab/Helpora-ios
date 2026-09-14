import SwiftUI

struct CommunityHubView: View {
    var body: some View {
        List {
            NavigationLink { EventsView() } label: {
                Label("Events", systemImage: "calendar")
            }
            NavigationLink { VolunteerView() } label: {
                Label("Volunteer", systemImage: "hands.sparkles.fill")
            }
            NavigationLink { OrganizationsView() } label: {
                Label("Organizations", systemImage: "building.2.fill")
            }
            NavigationLink { SafetyToolsView() } label: {
                Label("Safety tools", systemImage: "shield.fill")
            }
            NavigationLink { AccessibilityCenterView() } label: {
                Label("Accessibility", systemImage: "accessibility")
            }
        }
        .navigationTitle("Community Hub")
    }
}
