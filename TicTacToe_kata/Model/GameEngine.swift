//
//  GameEngine.swift
//  TicTacToe_kata
//

import Foundation

protocol BoardEngine {

    var winnerName: String {get}
    var gameStatus: GameStatus {get set}
    var currentPlayer: Case {get set}

    mutating func switchPlayer()
    mutating func resetGame()
    mutating func setCaseAt(_ index: Int) -> Case?
}

struct GameEngine: BoardEngine {

    private var allowedMoves = Constants.Base.allowedMoves
    private var gameState: GameStateProtocol
    var gameStatus: GameStatus = GameStatus.progress
    var currentPlayer: Case = .empty

    /**
     Constructs the winner's name
     - returns: a String that represents the name of the winner
     */
    var winnerName: String {
        return currentPlayer.rawValue
    }

    init(_ gameState: GameStateProtocol = GameState()) {
        self.gameState = gameState
    }

    @discardableResult mutating func setCaseAt(_ index: Int) -> Case? {
        guard index >= 0 && index <= 8
                && allowedMoves > 0
                && gameStatus == .progress else {
                    return nil
                }

        guard let `case` = gameState.getCaseAt(index), `case` == .empty else {
            return nil
        }

        let nextCase = getNextCase()

        gameState.setNewCase(at: index, case: nextCase)
        allowedMoves -= 1
        gameStatus = gameState.gameStatus(movesLeft: allowedMoves)
        switchPlayer()
        return nextCase
    }

    mutating func resetGame() {
        allowedMoves = Constants.Base.allowedMoves
        gameStatus = GameStatus.progress
        currentPlayer = .empty
        gameState = GameState()
    }

    /**
     Switch the previous player.
     If this is the first move, the player will be automatically a cross, then the player will switch to the opposite.
     */
    mutating func switchPlayer() {
        switch currentPlayer {
        case .empty, .circle:
            currentPlayer = .cross
        case .cross:
            currentPlayer = .circle
        }
    }

    // MARK: Convenients
    private func getNextCase() -> Case {
        switch currentPlayer {
        case .empty, .circle:
            // first move
            return .cross
        default:
            return .circle
        }
    }
}
