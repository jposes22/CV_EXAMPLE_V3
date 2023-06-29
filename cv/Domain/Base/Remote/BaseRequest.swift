import Foundation

enum Method: String, Codable {
    case GET
    case POST
    case PUT
    case UPDATE
    case DELETE
}
protocol BaseRequest: Codable {
    associatedtype Response: BaseResponse
    associatedtype BodyObject: Codable
    
    var method: Method { get }
    var path: String { get }
    var headers: [String: String] { get }
    var pathParameters: [String: String] { get }
    var bodyObject: BodyObjectBase? { get }
}

extension BaseRequest {
    typealias BodyObject = BodyObjectBase?

    var method: Method { .GET }
    var headers: [String: String] { [:] }
    var pathParameters: [String: String] { [:] }
    var bodyObject: BodyObjectBase? { nil }
}

struct BodyObjectBase: Codable {
    
}

extension BaseRequest {
    
    func getUrlRequest() -> URLRequest {
        // create final url
        let baseUrl = ApiConstants.baseApiUrl
        let urlWithPath = baseUrl.appending(path)
        
        guard let finalUrlWithParameters = appendPathParam(url: urlWithPath, pathParams: pathParameters),
        let url = URL(string: finalUrlWithParameters) else {
            fatalError("base url API error")
        }
        return makeRequest(for: url)
    }
    private func appendPathParam(url: String, pathParams: [String: String]) -> String? {
        
        var components = URLComponents(string: url)
        if !pathParams.isEmpty {
            components?.queryItems = pathParams.map { element in
                URLQueryItem(name: element.key, value: element.value)
            }
        }
        return components?.url?.absoluteString
    }
    
    private func makeRequest(for finalURL: URL) -> URLRequest {
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        for (headerField, headerValue) in headers {
            request.setValue(headerValue, forHTTPHeaderField: headerField)
        }
        if let bodyObject = self.bodyObject, let httpBody = try? JSONEncoder().encode(bodyObject) {
            request.httpBody = httpBody
        }
        return request
    }
}
