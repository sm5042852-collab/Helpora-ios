import SwiftUI

struct CreateHelpView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: HelpRequestStore
    @State private var title = ""
    @State private var details = ""
    @State private var category = "General"

    private var cleanedTitle: String { InputValidator.title(title) }
    private var cleanedDetails: String { InputValidator.details(details) }
    private var canSave: Bool { !cleanedTitle.isEmpty && cleanedTitle.count <= InputValidator.maxTitleLength }

    var body: some View {
        NavigationStack {
            Form {
                Section("What do you need?") {
                    TextField("Short title", text: $title)
                        .onChange(of: title) { _, value in title = String(value.prefix(InputValidator.maxTitleLength)) }
                    TextField("Describe your request", text: $details, axis: .vertical)
                        .lineLimit(3...8)
                        .onChange(of: details) { _, value in details = String(value.prefix(InputValidator.maxDetailsLength)) }
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
                    Text("Requests are validated before they are saved. Production authentication and authorization will be enforced by the backend.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Ask for help")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        store.add(title: cleanedTitle, details: cleanedDetails, category: category)
                        SecurityLogger.info("Help request created")
                        dismiss()
                    }
                    .disabled(!canSave)
                }
            }
        }
    }
}
