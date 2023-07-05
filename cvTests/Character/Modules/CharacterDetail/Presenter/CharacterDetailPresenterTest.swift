import XCTest
@testable import cv

class CharacterDetailPresenterTest: XCTestCase {
    var presenter: CharacterDetailPresenterImpl!
    var viewMock: CharacterDetailViewMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        presenter = CharacterDetailPresenterImpl()
        viewMock = CharacterDetailViewMock()
        presenter.view = viewMock
    }
    class CharacterDetailViewMock: CharacterDetailViewDisplayLogic {
        var displayModel: CharacterDetailDM?
        var displayCharacterDetailCalled = false
        
        func displayCharacterDetail(displayModel: CharacterDetailDM) {
            self.displayModel = displayModel
            displayCharacterDetailCalled = true
        }
    }
}

extension CharacterDetailPresenterTest {
    func testDisplayCharacterDetailWhenSuccess() {
        // Given
        let expectedResult = CharacterTestMock.getCharacterByIdResponse()
        presenter.presentCharacter(result: expectedResult)
        // When
        
        // Then
        assertIsSuccessResultAndNotNil(expectedResult)
        XCTAssertEqual(viewMock.displayModel?.id, 1)
        XCTAssertEqual(viewMock.displayModel?.name, "Rick Sanchez")
        XCTAssertTrue(viewMock.displayCharacterDetailCalled, "displayCharacterDetailCalled not called")
    }
}
