import Foundation

class CharacterRequest: BaseRequest {
        
    typealias Response = CharacterPageableResponse
    
    var path: String = "/character"
    
    var method: Method = .GET
    
}
