//
//  BoardViewModel.swift
//  TicTacToe_kata
//

import UIKit

protocol BoardVMDelegate: AnyObject {
    func gameFinished(text: String)
    func setImage(at index: Int, image: String)
}

final class BoardViewModel {
    private weak var delegate: BoardVMDelegate?
    private var gameEngine: BoardEngine

    init(gameEngine: BoardEngine = GameEngine(), delegate: BoardVMDelegate) {
        self.gameEngine = gameEngine
        self.delegate = delegate
    }

    func didSelectSquare(at index: Int) {
        guard let newCase = gameEngine.setCaseAt(index) else {
            return
        }

        delegate?.setImage(at: index, image: newCase.rawValue)
        checkGameState()
    }

    func resetGame() {
        gameEngine.resetGame()
    }

    /**
     Checks game's status and call the appropriate delegate function.
     if the game's status is a draw or a win, the delegate function gameFinished(text: String) will be called.
     */
    private func checkGameState() {

        switch gameEngine.gameStatus {
        case .draw:
            delegate?.gameFinished(text: "draw")
        case .win:
            let text = gameEngine.winnerName.localized + "win".localized
            delegate?.gameFinished(text: text)
        default:
            // game in progress
            break
        }
    }
}
