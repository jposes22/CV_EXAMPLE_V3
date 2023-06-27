import Foundation
@testable import cv

struct CharacterTestMock {
    private init() { /*Not Implement*/ }
    
    static let character = CharacterResponse(id: 1, name: "Rick Sanchez", status: .alive)
}
