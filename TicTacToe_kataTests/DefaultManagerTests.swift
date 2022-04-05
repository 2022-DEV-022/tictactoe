//
//  DefaultManagerTests.swift
//  TicTacToe_kataTests
//
//

import XCTest
@testable import TicTacToe_kata

class DefaultManagerTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testGetAndSet() throws {
        DefaultManager.language = nil
        XCTAssertTrue((DefaultManager.language == AllowedLanguage.fr.lang || DefaultManager.language == AllowedLanguage.en.lang))

        DefaultManager.language = AllowedLanguage.fr.lang
        XCTAssertTrue(DefaultManager.language == AllowedLanguage.fr.lang)

        DefaultManager.language = AllowedLanguage.en.lang
        XCTAssertTrue(DefaultManager.language == AllowedLanguage.en.lang)
    }
}
