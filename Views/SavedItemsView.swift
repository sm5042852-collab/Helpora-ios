import SwiftUI

struct SavedItemsView: View {
    var body: some View {
        ContentUnavailableView(
            "Saved items are coming",
            systemImage: "bookmark",
            description: Text("The interface is ready for the production data layer.")
        )
        .navigationTitle("Saved items")
    }
}
