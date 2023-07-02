import XCTest
@testable import cv

final class CharacterDetailViewTest: XCTestCase {
    
    var view: CharacterDetailView!
    var interactor: CharacterDetailInteractorMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        view = CharacterDetailView()
        interactor = CharacterDetailInteractorMock()
    }
    
    override func tearDownWithError() throws {
        view = nil
        interactor = nil
        try super.tearDownWithError()
    }
 
    class CharacterDetailInteractorMock: CharacterDetailInteractor {
        var presenter: CharacterDetailPresenter?
        var characterRepository: CharacterRepository?
        
        @Published private(set) var downloadCharacterByIdCalled = false
        
        func downloadCharacterById(characterId: Int) async {
            downloadCharacterByIdCalled = true
        }
    }
}
extension CharacterDetailViewTest {
    
    func testExample() throws {
        // Given
        view.interactor = interactor
        view.characterViewModel.setCharacterId(characterId: 1)
        
        // When
        view.fetchCharacterDetail()
        waitUntil(interactor.$downloadCharacterByIdCalled, equals: true)

        // Then
        XCTAssertTrue(
            interactor.downloadCharacterByIdCalled,
          "downloadCharacterById() should be called to load character detail"
        )
    }

}
