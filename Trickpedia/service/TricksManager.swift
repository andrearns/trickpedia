import Foundation

struct TricksManager {
    static var shared = TricksManager()
    
    func fetchTrickUsingID(id: Int) -> Trick? {
        let trick = TricksBank.shared.trickList.first { trick in
            trick.id == id
        }
        return trick
    }
}
