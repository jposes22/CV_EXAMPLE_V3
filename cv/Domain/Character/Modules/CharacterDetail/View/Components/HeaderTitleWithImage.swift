import SwiftUI

struct HeaderTitleWithImage: View {

    // MARK: - Properties
    @State var name: String
    @State var image: String
    
    var body: some View {
        VStack {
            // TODO: Add abstraction of library to cache images from url
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: image)) { content in
                    switch content {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        Image("default_placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    @unknown default:
                        Image("default_placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                Text(name)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(Color.white)
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
  
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
    }
}

struct HeaderTitleWithImage_Previews: PreviewProvider {
    static var previews: some View {
        let characterDetail = CharacterDetailDM(id: 1, name: "Rick", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        HeaderTitleWithImage(name: characterDetail.name, image: characterDetail.image)
    }
}
