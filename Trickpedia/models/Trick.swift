struct Trick {
    var id: Int
    var name: String
    var description: String
    var category: TrickCategory
    var level: TrickLevel
    var currentState: TrickState
    var requiredTricksIDs: [Int] = []
 }

enum TrickCategory: String {
    case flatground = "Solo"
    case rail = "Corrimão"
    case grab = "Grabs"
    case vertical = "Vertical"
    case freestyle = "Freestyle"
    case all = "Todas"
}

enum TrickState {
    case done
    case todo
    case locked
}

enum TrickLevel: String {
    case easy = "Fácil"
    case medium = "Intermediário"
    case hard = "Avançado"
}
