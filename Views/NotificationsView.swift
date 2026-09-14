import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject private var store: NotificationStore

    var body: some View {
        NavigationStack {
            Group {
                if store.items.isEmpty {
                    ContentUnavailableView(
                        "No notifications",
                        systemImage: "bell",
                        description: Text("Updates about your HELPORA activity will appear here.")
                    )
                } else {
                    List(store.items) { item in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.title).font(.headline)
                            Text(item.body).foregroundStyle(.secondary)
                        }
                        .opacity(item.isRead ? 0.6 : 1)
                    }
                }
            }
            .navigationTitle("Notifications")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Read all") { store.markAllRead() }
                }
            }
        }
    }
}
