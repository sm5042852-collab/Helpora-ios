import SwiftUI

struct CreateHelpView: View {
    @Environment(\.dismiss) private var dismiss
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
                        Text("Emergency guidance").tag("Emergency guidance")
                    }
                }

                Section {
                    Text("Your request is not published yet. Backend publishing will be connected in the next phase.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Ask for help")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { dismiss() }
                        .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
