import Foundation

enum ServiceCategory: String, CaseIterable, Codable, Identifiable {
    case dailyLife = "Daily life"
    case community = "Community"
    case translation = "Translation"
    case jobs = "Jobs"
    case housing = "Housing"
    case education = "Education"
    case healthGuidance = "Health guidance"
    case emergencyGuidance = "Emergency guidance"

    var id: String { rawValue }
}
