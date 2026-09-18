import Foundation
import Combine

@MainActor
final class HelpRequestStore: ObservableObject {
    @Published private(set) var requests: [HelpRequest] = []
    private let key = "helpora.helpRequests"
    private let cooldownKey = "helpora.publishCooldownUntil"

    init() {
        load()
        removeExpiredRequests()
    }

    var canPublish: Bool {
        guard let until = UserDefaults.standard.object(forKey: cooldownKey) as? Date else { return true }
        return until <= .now
    }

    func add(title: String, details: String, category: String) {
        guard canPublish else { return }
        requests.insert(HelpRequest(title: title, details: details, category: category), at: 0)
        save()
    }

    func beginResponseWindow(_ request: HelpRequest, hours: Int = 3) {
        guard let index = requests.firstIndex(where: { $0.id == request.id }) else { return }
        requests[index].status = .pendingResponse
        requests[index].responseDeadline = Calendar.current.date(byAdding: .hour, value: hours, to: .now)
        save()
    }

    func accept(_ request: HelpRequest) {
        guard let index = requests.firstIndex(where: { $0.id == request.id }) else { return }
        requests[index].status = .accepted
        requests[index].responseDeadline = nil
        save()
    }

    func confirmMeeting(_ request: HelpRequest) {
        guard let index = requests.firstIndex(where: { $0.id == request.id }) else { return }
        requests[index].status = .confirmed
        save()
    }

    func toggleResolved(_ request: HelpRequest) {
        guard let index = requests.firstIndex(where: { $0.id == request.id }) else { return }
        requests[index].isResolved.toggle()
        if requests[index].isResolved { requests[index].status = .closed }
        save()
    }

    func removeExpiredRequests() {
        let now = Date.now
        let expired = requests.contains { request in
            request.status == .pendingResponse && (request.responseDeadline ?? .distantFuture) <= now
        }
        requests.removeAll { request in
            request.status == .pendingResponse && (request.responseDeadline ?? .distantFuture) <= now
        }
        if expired {
            let until = Calendar.current.date(byAdding: .day, value: 3, to: now)
            UserDefaults.standard.set(until, forKey: cooldownKey)
        }
        save()
    }

    func delete(at offsets: IndexSet) {
        requests.remove(atOffsets: offsets)
        save()
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key), let decoded = try? JSONDecoder().decode([HelpRequest].self, from: data) else { return }
        requests = decoded
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(requests) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}
