//
//  BoardViewController.swift
//  TicTacToe_kata
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet private var buttons: [UIButton]!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var statusLabel: UILabel!

    private var boardViewModel: BoardViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        boardViewModel = BoardViewModel(delegate: self)
    }

    @IBAction func didPressBox(_ sender: UIButton) {
        boardViewModel.didSelectSquare(at: sender.tag)
    }

    @IBAction func didPressReset(_ sender: UIButton) {
        resetButton.isHidden = true
        for button in buttons {
            button.setImage(nil, for: .normal)
        }
        statusLabel.text = nil
        boardViewModel.resetGame()
    }
}

extension BoardViewController: BoardVMDelegate {
    func gameFinished(text: String) {
        statusLabel.text = text
        resetButton.isHidden = false
    }

    func setImage(at index: Int, image: String) {
        buttons[index].setImage(UIImage(named: image), for: .normal)
    }
}
