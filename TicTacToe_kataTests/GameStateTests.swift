//
//  TicTacToeKataTests.swift
//  TicTacToeKataTests
//

import XCTest
@testable import TicTacToe_kata

class GameStateTests: XCTestCase {

    var gameState: GameState!

    override func setUpWithError() throws {
        try super.setUpWithError()

    }

    override func tearDownWithError() throws {
        gameState = nil
        try super.tearDownWithError()
    }

    func testGetCases() throws {
        gameState = GameState()
        for i in 0..<9 {
            XCTAssertTrue(gameState.getCase(at: i) == .empty)
        }

        // invalid index
        XCTAssertTrue(gameState.getCase(at: -1) == nil)
        XCTAssertTrue(gameState.getCase(at: 9) == nil)
    }

    func testSetNewCase() throws {
        gameState = GameState()
        for i in 0..<9 {
            let `case`: Case = (i%2 == 0 ? .cross : .circle)
            gameState.setNewCase(at: i, case: `case`)
            XCTAssertTrue(gameState.getCase(at: i) == `case`)
        }
    }

    func testSetNewCaseWrongIndew() throws {
        gameState = GameState()
        for i in 0..<9 {
            //every index used to set the new case are wrong so the array of cases should be intact (.empty everywhere)
            gameState.setNewCase(at: (i+9), case: .circle)
            XCTAssertTrue(gameState.getCase(at: i) == .empty)
        }
    }

    func testInProgressStatus() throws {
        gameState = GameState()
        XCTAssertTrue(gameState.gameStatus(movesLeft: 9) == .progress)
    }

    func testDrawProgressStatus() throws {
        gameState = GameState()
        XCTAssertTrue(gameState.gameStatus(movesLeft: 0) == .progress)
    }

    func testDiagonalWin() {
        gameState = GameState(cases: [.cross, .circle, .empty,
                                      .circle, .cross, .empty,
                                      .empty, .empty, .cross])

        XCTAssertTrue(gameState.gameStatus(movesLeft: 4) == .win)

        gameState = GameState(cases: [.empty, .circle, .cross,
                                      .empty, .cross, .empty,
                                      .cross, .circle, .empty])

        XCTAssertTrue(gameState.gameStatus(movesLeft: 4) == .win)

    }

    func testHorizontalWin() {
        gameState = GameState(cases: [.cross, .cross, .cross,
                                     .circle, .circle, .empty,
                                     .empty, .empty, .empty])

        XCTAssertTrue(gameState.gameStatus(movesLeft: 4) == .win)

        gameState = GameState(cases: [.empty, .circle, .circle,
                                      .cross, .cross, .cross,
                                      .empty, .empty, .empty])

        XCTAssertTrue(gameState.gameStatus(movesLeft: 4) == .win)

        gameState = GameState(cases: [.circle, .circle, .empty,
                                       .empty, .empty, .empty,
                                       .cross, .cross, .cross])

        XCTAssertTrue(gameState.gameStatus(movesLeft: 4) == .win)

    }

    func testVerticalWin() {
        gameState = GameState(cases: [.cross, .circle, .empty,
                                     .cross, .circle, .empty,
                                     .cross, .empty, .empty])

        XCTAssertTrue(gameState.gameStatus(movesLeft: 4) == .win)

        gameState = GameState(cases: [.circle, .cross, .empty,
                                      .circle, .cross, .empty,
                                      .empty, .cross, .empty])

        XCTAssertTrue(gameState.gameStatus(movesLeft: 4) == .win)

        gameState = GameState(cases: [.circle, .empty, .cross,
                                       .circle, .empty, .cross,
                                       .empty, .empty, .cross])

        XCTAssertTrue(gameState.gameStatus(movesLeft: 4) == .win)

    }
}
