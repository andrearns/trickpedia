import Foundation

struct TricksBank {
    static var shared = TricksBank()
    
    var trickList: [Trick] = [
        Trick(id: 0, name: "Ollie", description: "O Ollie é a manobra fundamental do skate.", category: .flatground, level: .easy, currentState: .done, requiredTricksIDs: []),
        Trick(id: 1, name: "Flip", description: "O Flip é uma das manobras mais legais de mandar. O skate gira uma vez em baixo dos seus pés.", category: .flatground, level: .medium, currentState: .todo, requiredTricksIDs: [0]),
        Trick(id: 2, name: "Varial", description: "O Varial é uma manobra bem simples: é basicamente um giro de 180 graus para sua frente", category: .flatground, level: .hard, currentState: .done, requiredTricksIDs: [0]),
        Trick(id: 3, name: "Nollie", description: "O Nollie é a manobra é um pulo usando a base do Nollie. O nollie é uma junção do fakie com o switch.", category: .flatground, level: .easy, currentState: .todo, requiredTricksIDs: [0]),
        Trick(id: 4, name: "50-50", description: "O Ollie é a manobra fundamental do skate.", category: .rail, level: .medium, currentState: .todo, requiredTricksIDs: [0]),
        Trick(id: 5, name: "F/S Smith Grind", description: "O Flip é uma das manobras mais legais de mandar. O skate gira uma vez em baixo dos seus pés.", category: .rail, level: .hard, currentState: .todo, requiredTricksIDs: [4]),
        Trick(id: 6, name: "B/S Smith Grind", description: "O Varial é uma manobra bem simples: é basicamente um giro de 180 graus para sua frente", category: .rail, level: .medium, currentState: .todo, requiredTricksIDs: [1]),
        Trick(id: 7, name: "F/S Noseblunt", description: "O Nollie é a manobra é um pulo usando a base do Nollie. O nollie é uma junção do fakie com o switch.", category: .rail, level: .hard, currentState: .todo, requiredTricksIDs: [0, 1, 2, 3, 4])
    ]
}
