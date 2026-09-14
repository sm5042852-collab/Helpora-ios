import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView("No help requests yet", systemImage: "heart",
                description: Text("Create the first request in your community."))
                .navigationTitle("Help")
        }
    }
}
