import Foundation

struct AppNotification: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var body: String
    var createdAt: Date
    var isRead: Bool

    init(id: UUID = UUID(), title: String, body: String, createdAt: Date = .now, isRead: Bool = false) {
        self.id = id
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.isRead = isRead
    }
}
