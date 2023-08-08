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
        // TODO: not only check first
        let result = await characterRepository.getCharacters(page: 0)
        let characterResult = try? result.get().results.first
        let characterMock = CharacterTestMock.getCharacter()
        
        assertIsSuccessResultAndNotNil(result)
        XCTAssertEqual(characterResult, characterMock)
    }
    
    func testDownloadCharacterById() async throws {
        let result = await characterRepository.getCharacterById(id: 1)
        let characterResult = try? result.get()
        let characterMock = CharacterTestMock.getCharacter()
        
        assertIsSuccessResultAndNotNil(result)
        XCTAssertEqual(characterResult, characterMock)
    }

    func testPerformanceDownloadCharacters() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
