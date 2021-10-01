import Foundation

struct TricksManager {
    static var shared = TricksManager()
    
    func fetchTrickUsingID(id: Int) -> Trick? {
        let trick = TricksBank.shared.trickList.first { trick in
            trick.id == id
        }
        return trick
    }
    
    func checkIfTrickIsLocked(trick: Trick) {
        if trick.currentState != .done {
            var updatedTrick = trick
            var requirementTricksDone = 0
            
            for i in 0..<trick.requiredTricksIDs.count {
                let requiredTrick = fetchTrickUsingID(id: trick.requiredTricksIDs[i])!
                if requiredTrick.currentState == .done {
                    requirementTricksDone += 1
                }
            }
            
            if requirementTricksDone == trick.requiredTricksIDs.count {
                updatedTrick.currentState = .todo
            } else {
                updatedTrick.currentState = .locked
            }
            
            let trickIndex = TricksBank.shared.trickList.firstIndex { currentTrick in
                currentTrick.id == updatedTrick.id
            }
            
            TricksBank.shared.trickList[trickIndex!] = updatedTrick
        }
    }
    
    func checkIfTricksAreLocked() {
        for i in 0..<TricksBank.shared.trickList.count {
            checkIfTrickIsLocked(trick: TricksBank.shared.trickList[i])
        }
    }
}
