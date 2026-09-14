import SwiftUI

struct CreateHelpView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: HelpRequestStore
    @State private var title = ""
    @State private var details = ""
    @State private var category = "General"

    var body: some View {
        NavigationStack {
            Form {
                Section("What do you need?") {
                    TextField("Short title", text: $title)
                    TextField("Describe your request", text: $details, axis: .vertical)
                        .lineLimit(3...8)
                }
                Section("Category") {
                    Picker("Category", selection: $category) {
                        Text("General").tag("General")
                        Text("Daily life").tag("Daily life")
                        Text("Community").tag("Community")
                        Text("Translation").tag("Translation")
                        Text("Jobs").tag("Jobs")
                        Text("Housing").tag("Housing")
                        Text("Emergency guidance").tag("Emergency guidance")
                    }
                }
                Section {
                    Text("Saved requests stay on this device until the secure backend is connected.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Ask for help")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        store.add(title: title, details: details, category: category)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
