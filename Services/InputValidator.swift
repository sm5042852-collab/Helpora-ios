import Foundation

enum InputValidator {
    static let maxTitleLength = 120
    static let maxDetailsLength = 2_000
    static let maxBioLength = 500
    static let maxDisplayNameLength = 80
    static let maxCityLength = 100

    static func cleaned(_ value: String, maxLength: Int) -> String {
        let normalized = value
            .replacingOccurrences(of: "\u{0000}", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        return String(normalized.prefix(maxLength))
    }

    static func title(_ value: String) -> String {
        cleaned(value, maxLength: maxTitleLength)
    }

    static func details(_ value: String) -> String {
        cleaned(value, maxLength: maxDetailsLength)
    }

    static func bio(_ value: String) -> String {
        cleaned(value, maxLength: maxBioLength)
    }

    static func displayName(_ value: String) -> String {
        cleaned(value, maxLength: maxDisplayNameLength)
    }

    static func city(_ value: String) -> String {
        cleaned(value, maxLength: maxCityLength)
    }

    static func isValidURL(_ value: String) -> Bool {
        guard let url = URL(string: value),
              let scheme = url.scheme?.lowercased() else { return false }
        return scheme == "https"
    }
}
