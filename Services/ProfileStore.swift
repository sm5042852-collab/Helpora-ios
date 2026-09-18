import Foundation
import Combine

@MainActor
final class ProfileStore: ObservableObject {
    @Published var profile: UserProfile = .empty
    private let key = "helpora.profile"

    init() { load() }

    func save() {
        guard let data = try? JSONEncoder().encode(profile) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let value = try? JSONDecoder().decode(UserProfile.self, from: data) else { return }
        profile = value
    }
}
