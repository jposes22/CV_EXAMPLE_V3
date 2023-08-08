import Foundation

class CharacterRequest: BaseRequest {
        
    typealias Response = CharacterPageableResponse
    
    var path: String = "/character"
    
    var method: Method = .GET
    
    var pathParameters: [String: String] {
        return ["page": "\(page)"]
    }
    
    private let page: Int
    
    init(page: Int) {
        self.page = page
    }
}
