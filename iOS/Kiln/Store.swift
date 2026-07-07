import Foundation
import Combine

@MainActor
final class Store: ObservableObject {
    @Published var items: [Firing] = []
    @Published var isPro: Bool = false

    static let freeLimit = 8

    private let fileURL: URL = {
        let dir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir.appendingPathComponent("kiln_items.json")
    }()

    init() {
        load()
    }

    var canAddMore: Bool {
        isPro || items.count < Store.freeLimit
    }

    func add(_ item: Firing) {
        items.insert(item, at: 0)
        save()
    }

    func update(_ item: Firing) {
        guard let idx = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[idx] = item
        save()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    func delete(_ item: Firing) {
        items.removeAll { $0.id == item.id }
        save()
    }

    private func load() {
        if let data = try? Data(contentsOf: fileURL),
           let decoded = try? JSONDecoder().decode([Firing].self, from: data) {
            items = decoded
        } else {
            items = Store.seedData
        }
    }

    func save() {
        if let data = try? JSONEncoder().encode(items) {
            try? data.write(to: fileURL, options: .atomic)
        }
    }

    static let seedData: [Firing] = [
        Firing(pieceName: "Piecename 1", glaze: "Glaze 1", cone: "Cone 1", firingDate: Date().addingTimeInterval(-86400), outcome: "Outcome 1", notes: "Notes 1"),
        Firing(pieceName: "Piecename 2", glaze: "Glaze 2", cone: "Cone 2", firingDate: Date().addingTimeInterval(-172800), outcome: "Outcome 2", notes: "Notes 2"),
        Firing(pieceName: "Piecename 3", glaze: "Glaze 3", cone: "Cone 3", firingDate: Date().addingTimeInterval(-259200), outcome: "Outcome 3", notes: "Notes 3")
    ]
}
