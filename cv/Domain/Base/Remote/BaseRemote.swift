import Foundation

protocol BaseRemote: AnyObject {
    func fetchRequest<T: BaseRequest>(request: T) async -> Result<T.Response, ApiError>
}
