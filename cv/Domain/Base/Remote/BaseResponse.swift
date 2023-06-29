import Foundation

protocol BaseResponse: Codable, Equatable {
    
}

protocol BasePageableResponse: BaseResponse {
    associatedtype ResultResponse: BaseResponse
    
    var results: [ResultResponse] { get set }
}
