import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published private(set) var characterId: Int?
    @Published var characterDetail: CharacterDetailDM?
    
    func setCharacterId(characterId: Int) {
        self.characterId = characterId
    }
}

#if DEBUG
extension CharacterDetailViewModel {
    static var sample: CharacterDetailViewModel {
        let model = CharacterDetailViewModel()
        
        model.characterDetail = CharacterDetailDM(
            id: 1,
            name: "Rick",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        )
        
        return model
    }
}
#endif
