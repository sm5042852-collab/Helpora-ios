import Foundation

@MainActor
final class NotificationStore: ObservableObject {
    @Published private(set) var items: [AppNotification] = []
    private let key = "helpora.notifications.items"

    init() { load() }

    func add(title: String, body: String) {
        items.insert(AppNotification(title: title, body: body), at: 0)
        save()
    }

    func markAllRead() {
        items.indices.forEach { items[$0].isRead = true }
        save()
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let value = try? JSONDecoder().decode([AppNotification].self, from: data) else { return }
        items = value
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}
