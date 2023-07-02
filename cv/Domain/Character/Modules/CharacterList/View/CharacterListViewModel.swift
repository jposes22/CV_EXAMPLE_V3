import Foundation

class CharacterListViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var characterList: [CharacterListDM] = []
}

#if DEBUG
extension CharacterListViewModel {
  static var sample: CharacterListViewModel {
    let model = CharacterListViewModel()

    model.characterList = [
        CharacterListDM(id: 1, name: "Rick", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        CharacterListDM(id: 2, name: "Morty Smith long surname to test what happend", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
        CharacterListDM(id: 3, name: "Summer Smith", image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"),
        CharacterListDM(id: 4, name: "Beth Smith", image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"),
        CharacterListDM(id: 5, name: "Jerry Smith", image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg"),
        CharacterListDM(id: 6, name: "Abadango Cluster Princess", image: "https://rickandmortyapi.com/api/character/avatar/6.jpeg"),
        CharacterListDM(id: 7, name: "Abradolf Lincler", image: "https://rickandmortyapi.com/api/character/avatar/7.jpeg"),
        CharacterListDM(id: 8, name: "Adjudicator Rick", image: "https://rickandmortyapi.com/api/character/avatar/8.jpeg")
    ]

    return model
  }
}
#endif
