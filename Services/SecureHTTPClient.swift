import Foundation

/// Minimal network guard for the future production API.
/// Authentication and authorization remain server-side responsibilities.
final class SecureHTTPClient {
    static let shared = SecureHTTPClient()
    private let session: URLSession

    private init() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.waitsForConnectivity = true
        configuration.httpCookieStorage = nil
        configuration.urlCredentialStorage = nil
        session = URLSession(configuration: configuration)
    }

    func request(_ url: URL, method: String = "GET", body: Data? = nil) async throws -> (Data, HTTPURLResponse) {
        guard url.scheme?.lowercased() == "https" else {
            throw URLError(.appTransportSecurityRequiresSecureConnection)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        if body != nil { request.setValue("application/json", forHTTPHeaderField: "Content-Type") }

        let (data, response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        guard (200...299).contains(http.statusCode) else { throw URLError(.badServerResponse) }
        return (data, http)
    }
}
