import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String
    var retryAction: () -> Void
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search", text: $searchText)
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .font(.headline)
            .background(.ultraThinMaterial)
            .foregroundColor(.white.opacity(0.6))
            .cornerRadius(20)
            
            Button {
                retryAction()
            } label: {
                Image(systemName: "square.and.arrow.down")
                    .tint(Color.white)
            }
        }
        
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomSearchBar(searchText: .constant("")) {
                
            }
            
        }.background(Color.black)
    }
}
