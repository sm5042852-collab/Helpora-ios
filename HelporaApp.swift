import SwiftUI

@main
struct HelporaApp: App {
    @StateObject private var helpStore = HelpRequestStore()
    @StateObject private var profileStore = ProfileStore()
    @StateObject private var notificationStore = NotificationStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(helpStore)
                .environmentObject(profileStore)
                .environmentObject(notificationStore)
        }
    }
}
