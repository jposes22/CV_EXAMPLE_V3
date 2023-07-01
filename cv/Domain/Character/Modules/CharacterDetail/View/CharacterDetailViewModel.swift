import Foundation

@MainActor class CharacterDetailViewModel: ObservableObject {
    @Published var characterId: Int?
    @Published var characterDetail: CharacterDetailDM?
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
