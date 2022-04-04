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
        boardViewModel = BoardViewModel()
    }

    @IBAction func didPressBox(_ sender: UIButton) {
    }

    @IBAction func didPressReset(_ sender: UIButton) {
    }
}
