import Foundation

@MainActor
final class HelpRequestStore: ObservableObject {
    @Published private(set) var requests: [HelpRequest] = []
    private let key = "helpora.helpRequests"

    init() { load() }

    func add(title: String, details: String, category: String) {
        requests.insert(HelpRequest(title: title, details: details, category: category), at: 0)
        save()
    }

    func toggleResolved(_ request: HelpRequest) {
        guard let index = requests.firstIndex(where: { $0.id == request.id }) else { return }
        requests[index].isResolved.toggle()
        save()
    }

    func delete(at offsets: IndexSet) {
        requests.remove(atOffsets: offsets)
        save()
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([HelpRequest].self, from: data) else { return }
        requests = decoded
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(requests) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}
