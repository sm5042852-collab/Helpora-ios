import SwiftUI

struct DiscoverView: View {
    @State private var searchText = ""

    private let categories = [
        ("Daily life", "house.fill"),
        ("Community", "person.2.fill"),
        ("Translation", "character.book.closed.fill"),
        ("Jobs", "briefcase.fill"),
        ("Housing", "building.2.fill"),
        ("Education", "graduationcap.fill"),
        ("Health guidance", "cross.case.fill"),
        ("Emergency", "exclamationmark.triangle.fill")
    ]

    var filtered: [(String, String)] {
        searchText.isEmpty ? categories : categories.filter { $0.0.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Explore") {
                    ForEach(filtered, id: \.0) { item in
                        Label(item.0, systemImage: item.1)
                    }
                }
                Section("Coming next") {
                    Label("Local community map", systemImage: "map.fill")
                    Label("Verified organizations", systemImage: "checkmark.seal.fill")
                    Label("Events and volunteering", systemImage: "calendar")
                }
            }
            .navigationTitle("Discover")
            .searchable(text: $searchText, prompt: "Search HELPORA")
        }
    }
}
