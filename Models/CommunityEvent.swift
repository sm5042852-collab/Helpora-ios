import Foundation

struct CommunityEvent: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var location: String
    var date: Date
}
