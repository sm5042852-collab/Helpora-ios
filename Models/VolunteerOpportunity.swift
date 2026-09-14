import Foundation

struct VolunteerOpportunity: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var organization: String
    var city: String
    var createdAt: Date

    init(id: UUID = UUID(), title: String, organization: String, city: String, createdAt: Date = .now) {
        self.id = id
        self.title = title
        self.organization = organization
        self.city = city
        self.createdAt = createdAt
    }
}
