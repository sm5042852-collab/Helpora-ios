import Foundation

enum MeetingConnectionStatus: String, Codable {
    case requested
    case accepted
    case mutuallyConfirmed
    case expired
}

struct MeetingConnection: Identifiable, Codable, Hashable {
    let id: UUID
    let requestID: UUID
    var status: MeetingConnectionStatus
    var createdAt: Date
    var expiresAt: Date
    var chatEnabled: Bool

    init(id: UUID = UUID(), requestID: UUID, status: MeetingConnectionStatus = .requested, createdAt: Date = .now, expiresAt: Date, chatEnabled: Bool = true) {
        self.id = id
        self.requestID = requestID
        self.status = status
        self.createdAt = createdAt
        self.expiresAt = expiresAt
        self.chatEnabled = chatEnabled
    }
}
