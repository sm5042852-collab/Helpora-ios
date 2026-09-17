import Foundation
import os

/// Privacy-aware app logging. Never log passwords, tokens, precise location, or message bodies.
enum SecurityLogger {
    private static let logger = Logger(subsystem: "com.helpora.app", category: "security")

    static func info(_ message: String) {
        logger.info("\(message, privacy: .public)")
    }

    static func warning(_ message: String) {
        logger.warning("\(message, privacy: .public)")
    }

    static func error(_ message: String) {
        logger.error("\(message, privacy: .public)")
    }
}
