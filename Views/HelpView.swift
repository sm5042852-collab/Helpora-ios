import SwiftUI

struct HelpView: View {
    @State private var showingCreateHelp = false

    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "No help requests yet",
                systemImage: "heart",
                description: Text("Be the first person to ask for or offer help in your community.")
            )
            .navigationTitle("Help")
            .toolbar {
                Button {
                    showingCreateHelp = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingCreateHelp) {
                CreateHelpView()
            }
        }
    }
}
