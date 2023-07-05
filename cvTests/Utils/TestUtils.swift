import Foundation
import XCTest

final class TestUtils {
    private init() {}
    
    static func parseLocalJsonToObject<T: Codable>(with name: String) -> T? {
        do {
            return try Bundle(for: TestUtils.self).url(forResource: name, withExtension: ".json")
                .flatMap { try Data(contentsOf: $0) }
                .flatMap { try JSONDecoder().decode(T.self, from: $0) }
        } catch {
            return nil
        }
    }
}
