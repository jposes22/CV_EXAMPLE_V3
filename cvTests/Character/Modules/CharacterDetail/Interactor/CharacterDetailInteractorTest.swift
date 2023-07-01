import XCTest
@testable import cv

class CharacterDetailInteractorTest: XCTestCase {
    var interactor: CharacterDetailInteractor!
    var presenterMock: CharacterDetailPresenterMock!
    var characterRepositoryMock: CharacterRepositoryMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        characterRepositoryMock = CharacterRepositoryMock()
        interactor = CharacterDetailInteractorImpl()
        interactor.characterRepository = characterRepositoryMock
        presenterMock = CharacterDetailPresenterMock()
        interactor.presenter = presenterMock
    }
    
    override func tearDownWithError() throws {
        characterRepositoryMock = nil
        interactor = nil
        presenterMock = nil
        try super.tearDownWithError()
    }
    
    class CharacterDetailPresenterMock: CharacterDetailPresenter {
        var view: CharacterDetailViewDisplayLogic?
        
        var characterPageableResult: Result<CharacterResponse, ApiError>?
        var presentCharacterCalled = false
        
        func presentCharacter(result: Result<CharacterResponse, ApiError>) {
            characterPageableResult = result
            presentCharacterCalled = true
        }
    }
}

extension CharacterDetailInteractorTest {
    func testPresentCharacterWhenSuccess() async {
        // Given
        characterRepositoryMock.willReturnCharacterById(result: CharacterTestMock.getCharacterByIdResponse())

        // When
        await interactor.downloadCharacterById(characterId: 1)

        // Then
        XCTAssertTrue(presenterMock.presentCharacterCalled)
    }
}
