import Foundation

struct TrustProfile: Codable, Hashable {
    var score: Int = 100
    var completedMeetings: Int = 0
    var missedResponses: Int = 0
    var reportsReceived: Int = 0
    var isRestricted: Bool = false
}
