import SwiftUI

@main
struct HelporaApp: App {
    @StateObject private var helpStore = HelpRequestStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(helpStore)
        }
    }
}
