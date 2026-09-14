import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }

            DiscoverView()
                .tabItem { Label("Discover", systemImage: "safari.fill") }

            HelpView()
                .tabItem { Label("Help", systemImage: "heart.fill") }

            InboxView()
                .tabItem { Label("Inbox", systemImage: "bubble.left.and.bubble.right.fill") }

            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.fill") }
        }
        .tint(.purple)
    }
}
