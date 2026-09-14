import Foundation

struct UserProfile: Codable, Hashable {
    var displayName: String
    var bio: String
    var city: String
    var languages: [String]
    var isVerified: Bool
    var hpPoints: Int

    static let empty = UserProfile(
        displayName: "",
        bio: "",
        city: "",
        languages: [],
        isVerified: false,
        hpPoints: 0
    )
}
