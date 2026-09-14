import Foundation

struct HelpRequest: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var details: String
    var category: String
    var createdAt: Date
    var isResolved: Bool

    init(id: UUID = UUID(), title: String, details: String, category: String, createdAt: Date = .now, isResolved: Bool = false) {
        self.id = id
        self.title = title
        self.details = details
        self.category = category
        self.createdAt = createdAt
        self.isResolved = isResolved
    }
}
