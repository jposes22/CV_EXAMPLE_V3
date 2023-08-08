import XCTest
@testable import cv

class CharacterListInteractorTest: XCTestCase {
    var interactor: CharacterListInteractor!
    var presenterMock: CharacterListPresenterMock!
    var characterRepositoryMock: CharacterRepositoryMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        characterRepositoryMock = CharacterRepositoryMock()
        interactor = CharacterListInteractorImpl()
        interactor.characterRepository = characterRepositoryMock
        presenterMock = CharacterListPresenterMock()
        interactor.presenter = presenterMock
    }
    
    override func tearDownWithError() throws {
        characterRepositoryMock = nil
        interactor = nil
        presenterMock = nil
        try super.tearDownWithError()
    }
    
    class CharacterListPresenterMock: CharacterListPresenter {
        var view: CharacterListViewDisplayLogic?
        var presentCharacter: Result<CharacterPageableResponse, ApiError>?
        var presentCharacterIsCalled: Bool = false
        
        func presentCharacters(result: Result<CharacterPageableResponse, ApiError>) {
            presentCharacter = result
            presentCharacterIsCalled = true
        }
        
    }
}

extension CharacterListInteractorTest {
    func testPresentCharactersWhenSuccess() async {
        // Given
        let expectedResult = CharacterTestMock.getCharacterPageableResponse()
        characterRepositoryMock.willReturnCharacters(result: expectedResult)

        // When
        await interactor.downloadCharacterList(page: 0)

        // Then
        assertIsSuccessResultAndNotNil(expectedResult)
        XCTAssertTrue(presenterMock.presentCharacterIsCalled)
    }
}
