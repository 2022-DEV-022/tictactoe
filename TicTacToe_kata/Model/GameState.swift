//
//  GameState.swift
//  TicTacToe_kata
//

import Foundation

enum Case {
    case empty
    case cross
    case circle
}

enum GameStatus {
    case win
    case draw
    case progress
}

protocol GameStateProtocol {
    mutating func setNewCase(at index: Int, case: Case)

    func getCase(at index: Int) -> Case?
    func gameStatus(movesLeft: Int) -> GameStatus
}

struct GameState: GameStateProtocol {
    private var cases: [Case]

    init(cases: [Case] = Constants.Base.caseStatus) {
        self.cases = cases
    }

    /**
     Set a piece on a board's case between 0 and 8 (case 1 - 9).
     If this is the first move, the piece will be automatically a cross, then the engine will switch to the opposite.

     - Parameter index: The index relative to the case
     - Parameter case: The case that need to be set

     */
    mutating func setNewCase(at index: Int, case: Case) {
        guard index >= 0 && index <= 8 else {
            return
        }
        cases[index] = `case`
    }

    /**
     Get a case on a board's case between 0 and 8 (case 1 - 9).

     - Parameter index: The index relative to the case
     - returns: Returns nil if the index isn't between 0 and 8, otherwhise, returns the case
     */
    func getCase(at index: Int) -> Case? {
        guard index >= 0 && index <= 8 else {
            return nil
        }
        return cases[index]
    }

    /**
     Checks all the winnable conditions and return the approriate game's status
     - returns: a GameStatus that indicate the game's status
     */
    func gameStatus(movesLeft: Int) -> GameStatus {
        return .draw
    }
}
