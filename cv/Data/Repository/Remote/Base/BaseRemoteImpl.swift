import Foundation

enum ApiError: Error {
    case internalError
    case appInternalError
    case unauthorized
    case wrongData
    case timeout
}

final class BaseRemoteImpl: BaseRemote {
     func fetchRequest<T: BaseRequest>(request: T) async -> Result<T.Response, ApiError> {
        
        let urlRequest = request.getUrlRequest()
         BaseRemoteImpl.createLogRequest(urlRequest: urlRequest)
        
        do {
            let (data, response) = try await createSession().data(for: urlRequest)
            // TODO: Handle api errors
            guard checkStatusCode(response: response) != nil else {
                return .failure(ApiError.internalError)
            }
            // Decode data json to object
            // TODO: Handle Api parse errors and show decodable fields are wrong
            guard let dataModel = try? JSONDecoder().decode(T.Response.self, from: data) else {
                return .failure(ApiError.internalError)
            }
            return .success(dataModel)
            // TODO: Handle api errors
        } catch _ {
            // handle error
            return Result.failure(.internalError)
        }
    }
}
// MARK: - Util methods
private extension BaseRemoteImpl {
    
    func createSession() -> URLSession {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60.0
        sessionConfig.timeoutIntervalForResource = 60.0
        return URLSession(configuration: sessionConfig)
    }
    
}

// MARK: - Util handle Errors
private extension BaseRemoteImpl {
    
    func checkStatusCode(response: URLResponse) -> HTTPURLResponse? {
        guard let httpUrlResponse = response as? HTTPURLResponse, 200...299 ~= httpUrlResponse.statusCode else {
            return nil
        }
        return httpUrlResponse
    }
    
}
// MARK: - Util Logs
private extension BaseRemoteImpl {
    
    static func createLogResponse(url: String, data: Data?, response: URLResponse?, error: Error?) {
        debugPrint(" <---- " + url)
        if let data = data {
            debugPrint(" HTTP BODY RESPONSE: \(String(decoding: data, as: UTF8.self))")
        }
    }
    
    static func createLogRequest(urlRequest: URLRequest) {
        debugPrint(" ----> " + (urlRequest.url?.absoluteString ?? ""))
        debugPrint(" HTTP METHOD: \(urlRequest.httpMethod ?? "GET")")
        urlRequest.allHTTPHeaderFields?.forEach({ (key: String, value: String) in
            debugPrint(" HTTP HEADERS: \(key) \(value)")
        })
        if let data = urlRequest.httpBody {
            debugPrint(" HTTP BODY: \(String(decoding: data, as: UTF8.self))")
        }
    }
}
