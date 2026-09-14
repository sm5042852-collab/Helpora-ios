import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: ProfileStore
    @State private var displayName = ""
    @State private var bio = ""
    @State private var city = ""
    @State private var selectedLanguages: Set<String> = []

    private let languages = ["English", "Türkçe", "Deutsch", "Kurdî", "العربية", "Русский", "Українська", "Română", "Shqip"]

    var body: some View {
        Form {
            Section("Basic information") {
                TextField("Display name", text: $displayName)
                TextField("City", text: $city)
                TextField("Bio", text: $bio, axis: .vertical)
                    .lineLimit(3...6)
            }
            Section("Languages") {
                ForEach(languages, id: \.self) { language in
                    Button {
                        if selectedLanguages.contains(language) {
                            selectedLanguages.remove(language)
                        } else {
                            selectedLanguages.insert(language)
                        }
                    } label: {
                        HStack {
                            Text(language)
                            Spacer()
                            if selectedLanguages.contains(language) {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Edit profile")
        .onAppear {
            displayName = store.profile.displayName
            bio = store.profile.bio
            city = store.profile.city
            selectedLanguages = Set(store.profile.languages)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    store.profile.displayName = displayName
                    store.profile.bio = bio
                    store.profile.city = city
                    store.profile.languages = Array(selectedLanguages).sorted()
                    store.save()
                    dismiss()
                }
            }
        }
    }
}
