//
//  GameEngineTests.swift
//  TicTacToe_kataTests
//
//

import XCTest
@testable import TicTacToe_kata

class GameEngineTests: XCTestCase {

    var gameEngine: BoardEngine!

    override func setUpWithError() throws {
        gameEngine = GameEngine()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        gameEngine = nil
        try super.tearDownWithError()
    }

    func testWinnerName() {
        XCTAssertFalse(gameEngine.winnerName.isEmpty)

        for i in 0..<7 {
            gameEngine.setCaseAt(i)
        }
        XCTAssertTrue(gameEngine.winnerName == Case.cross.rawValue)
    }

    func testSetCase() {
        // invalid index
        XCTAssertTrue(gameEngine.setCaseAt(-1) == nil)
        XCTAssertTrue(gameEngine.setCaseAt(9) == nil)
        // first play
        XCTAssertTrue(gameEngine.setCaseAt(1) == .cross)
        // already set
        XCTAssertTrue(gameEngine.setCaseAt(1) == nil)
    }

    func testSwitchPlayer() {
        for i in 0..<6 {
            let newCase = Case.init(rawValue: gameEngine.setCaseAt(i)!.rawValue)!
            let player = Case.init(rawValue: gameEngine.currentPlayer.rawValue)!

            XCTAssertTrue(player == newCase)
        }

        var newCase = Case.init(rawValue: gameEngine.setCaseAt(7)!.rawValue)!
        var player = Case.init(rawValue: gameEngine.currentPlayer.rawValue)!
        // go back manualy here because at index 6 we'll have a win and the game doesn't allow to setCase with a win
        XCTAssertTrue(player == newCase)

        newCase = Case.init(rawValue: gameEngine.setCaseAt(6)!.rawValue)!
        player = Case.init(rawValue: gameEngine.currentPlayer.rawValue)!
        XCTAssertTrue(player == newCase)

        newCase = Case.init(rawValue: gameEngine.setCaseAt(8)!.rawValue)!
        player = Case.init(rawValue: gameEngine.currentPlayer.rawValue)!
        XCTAssertTrue(player == newCase)
    }
}
