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
    }

    func testSetCase() {
        // invalid index
        XCTAssertTrue(gameEngine.setCaseAt(-1) == nil)
        XCTAssertTrue(gameEngine.setCaseAt(9) == nil)
        XCTAssertFalse(gameEngine.setCaseAt(1) == nil)
    }

    func testSwitchPlayerCase() {
        gameEngine.setCaseAt(1)
        gameEngine.switchPlayer()

        XCTAssertTrue(gameEngine.currentPlayer != .empty)
    }
}
