import Foundation

enum RequestStatus: String, Codable, CaseIterable {
    case published
    case pendingResponse
    case accepted
    case confirmed
    case closed
}

struct HelpRequest: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var details: String
    var category: String
    var createdAt: Date
    var isResolved: Bool
    var status: RequestStatus
    var responseDeadline: Date?

    init(id: UUID = UUID(), title: String, details: String, category: String, createdAt: Date = .now, isResolved: Bool = false, status: RequestStatus = .published, responseDeadline: Date? = nil) {
        self.id = id
        self.title = title
        self.details = details
        self.category = category
        self.createdAt = createdAt
        self.isResolved = isResolved
        self.status = status
        self.responseDeadline = responseDeadline
    }
}
