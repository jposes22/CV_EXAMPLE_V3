import SwiftUI

// MARK: - Display
protocol CharacterListViewDisplayLogic {
    func displayCharacterList(displayModel: [CharacterListDM])
}

extension CharacterListView: CharacterListViewDisplayLogic {
    func displayCharacterList(displayModel: [CharacterListDM]) {
        DispatchQueue.main.async {
            characterViewModel.characterList = displayModel
        }
    }
    
    func fetchCharacters() {
        interactor?.downloadCharacterList()
    }
    
}

struct CharacterListView: View {
    // MARK: - Interactor
    var interactor: CharacterListInteractor?
    // MARK: - Properties
    @ObservedObject var characterViewModel = CharacterListViewModel()
    let columns: [GridItem] =  [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        // TODO: Remove NavigationStack and implement router system to navigate
        NavigationStack {
            VStack {
                CustomSearchBar(searchText: $characterViewModel.searchText)
                    .padding(PaddingUtils.normalPadding)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: PaddingUtils.normalPadding) {
                        ForEach(characterViewModel.characterList, id: \.id) { character in
                            NavigationLink {
                                CharacterDetailConfigurator.createModule(characterId: character.id)
                            } label: {
                                CharacterListCardView(character: character)
                            }
                        }
                    }
                }
            }
            .padding(PaddingUtils.smallPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.backgroundGradientColor)
            .onAppear {
                fetchCharacters()
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characterViewModel: CharacterListViewModel.sample)
    }
}
