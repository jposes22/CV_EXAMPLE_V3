//
//  CharacterRepositoryTests.swift
//  cvTests
//
//  Created by DESGA on 27/6/23.
//

import XCTest
@testable import cv

final class CharacterRepositoryTests: XCTestCase {

    var characterRepository: CharacterRepository!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        characterRepository = CharacterRepositoryImpl(baseRemote: BaseRemoteImpl())

    }

    override func tearDownWithError() throws {
        characterRepository = nil
        try super.tearDownWithError()
    }

    func testDownloadCharacters() async throws {
        let result = await characterRepository.getCharacters()
        let characterResult = try? result.get().results.first
        let characterMock = CharacterTestMock.character
        XCTAssertEqual(characterResult, characterMock)
    }

    func testPerformanceDownloadCharacters() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
