import Foundation

struct Firing: Identifiable, Codable, Equatable {
    let id: UUID
    var createdAt: Date
    var pieceName: String
    var glaze: String
    var cone: String
    var firingDate: Date
    var outcome: String
    var notes: String

    init(id: UUID = UUID(), createdAt: Date = Date(), pieceName: String = "", glaze: String = "", cone: String = "", firingDate: Date = Date(), outcome: String = "", notes: String = "") {
        self.id = id
        self.createdAt = createdAt
        self.pieceName = pieceName
        self.glaze = glaze
        self.cone = cone
        self.firingDate = firingDate
        self.outcome = outcome
        self.notes = notes
    }
}
