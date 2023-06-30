import SwiftUI

struct CharacterDetailView: View {
    let character: CharacterListDM
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HeaderTitleWithImage(name: character.name ?? "", image: character.image)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.backgroundGradientColor)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CharacterDetailView(character: CharacterListDM(id: 1, name: "test", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        }
    }
}
