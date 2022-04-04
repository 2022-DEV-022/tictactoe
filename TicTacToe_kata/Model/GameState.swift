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

        // we starts to check the winnable condition when there's enough move done to have a win.
        guard movesLeft <= 4 else {
            return .progress
        }

        guard isDiagonalWin() != .win else {
            return .win
        }

        guard isHorizontalWin() != .win else {
            return .win
        }

        guard isVerticalWin() != .win else {
            return .win
        }

        guard movesLeft > 0 else {
            return .draw
        }
        return .progress
    }

    // MARK: Convenients
    private func isDiagonalWin() -> GameStatus {

        // test (left) diagonal row [0,4,8] = [x,0,0,0,x,0,0,0,x]
        if cases[0] == cases[4] && cases[0] == cases[8] && cases[0] != .empty {
            return .win
        }
        // test (right) diagonal row [2,4,6] = [0,0,x,0,x,0,x,0,0]
        if cases[2] == cases[4] && cases[2] == cases[6] && cases[2] != .empty {
            return .win
        }
        return .progress
    }

    private func isHorizontalWin() -> GameStatus {
        // test first (top) horizontal row [0,1,2] = [x,x,x,0,0,0,0,0,0]
        if cases[0] == cases[1] && cases[0] == cases[2] && cases[0] != .empty {
            return .win
        }
        // test first horizontal row [3,4,5] = [0,0,0,x,x,x,0,0,0]
        if cases[3] == cases[4] && cases[3] == cases[5] && cases[3] != .empty {
            return .win
        }
        // test first horizontal row  [6,7,8] = [0,0,0,0,0,0,x,x,x]
        if cases[6] == cases[7] && cases[6] == cases[8] && cases[6] != .empty {
            return .win
        }
        return .progress
    }

    private func isVerticalWin() -> GameStatus {

        // test first (left) vertical row [0,3,6] = [x,0,0,x,0,0,x,0,0]
        if cases[0] == cases[3] && cases[0] == cases[6] && cases[0] != .empty {
            return .win
        }
        // test second vertical row [1,4,7] = [0,x,0,0,x,0,0,x,0]
        if cases[1] == cases[4] && cases[1] == cases[7] && cases[1] != .empty {
            return .win
        }
        // test third vertical row [2,5,8] = [0,0,x,0,0,x,0,0,x]
        if cases[2] == cases[5] && cases[2] == cases[8] && cases[2] != .empty {
            return .win
        }
        return .progress
    }
}
