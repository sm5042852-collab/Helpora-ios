import SwiftUI

struct SavedItemsView: View {
    @EnvironmentObject private var helpStore: HelpRequestStore
    @EnvironmentObject private var savedStore: SavedRequestStore

    var savedRequests: [HelpRequest] {
        helpStore.requests.filter { savedStore.contains($0.id) }
    }

    var body: some View {
        List {
            if savedRequests.isEmpty {
                ContentUnavailableView(
                    "No saved items",
                    systemImage: "bookmark",
                    description: Text("Save help requests to find them quickly later.")
                )
            } else {
                ForEach(savedRequests) { request in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(request.title).font(.headline)
                        Text(request.category).font(.caption).foregroundStyle(.secondary)
                        Text(request.details).font(.subheadline)
                    }
                }
            }
        }
        .navigationTitle("Saved items")
    }
}
