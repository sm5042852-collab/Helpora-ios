import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Your inbox is ready",
                systemImage: "bubble.left.and.bubble.right",
                description: Text("Messages will appear here when community chat is connected.")
            )
            .navigationTitle("Inbox")
        }
    }
}
