import SwiftUI

struct HelpView: View {
    @EnvironmentObject private var store: HelpRequestStore
    @State private var showingCreateHelp = false

    var body: some View {
        NavigationStack {
            Group {
                if store.requests.isEmpty {
                    ContentUnavailableView(
                        "No help requests yet",
                        systemImage: "heart",
                        description: Text("Create your first request and build the community.")
                    )
                } else {
                    List {
                        ForEach(store.requests) { request in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(request.category)
                                        .font(.caption.bold())
                                        .foregroundStyle(.purple)
                                    Spacer()
                                    if request.isResolved {
                                        Label("Resolved", systemImage: "checkmark.circle.fill")
                                            .font(.caption)
                                            .foregroundStyle(.green)
                                    }
                                }
                                Text(request.title).font(.headline)
                                Text(request.details)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                Button(request.isResolved ? "Mark open" : "Mark resolved") {
                                    store.toggleResolved(request)
                                }
                                .font(.caption)
                            }
                            .padding(.vertical, 6)
                        }
                        .onDelete(perform: store.delete)
                    }
                }
            }
            .navigationTitle("Help")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showingCreateHelp = true } label: { Image(systemName: "plus") }
                }
            }
            .sheet(isPresented: $showingCreateHelp) {
                CreateHelpView()
            }
        }
    }
}
