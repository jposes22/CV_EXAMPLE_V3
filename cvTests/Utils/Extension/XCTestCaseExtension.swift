import Foundation
import XCTest
import Combine

extension XCTestCase {
    // reference: https://www.swiftbysundell.com/articles/writing-testable-code-when-using-swiftui/
    func waitUntil<T: Equatable>(
        _ propertyPublisher: Published<T>.Publisher,
        equals expectedValue: T,
        timeout: TimeInterval = 10,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let expectation = expectation(
            description: "Awaiting value \(expectedValue)"
        )
        
        var cancellable: AnyCancellable?
        
        cancellable = propertyPublisher
            .dropFirst()
            .first(where: { $0 == expectedValue })
            .sink { value in
                XCTAssertEqual(value, expectedValue, file: file, line: line)
                cancellable?.cancel()
                expectation.fulfill()
            }
        
        waitForExpectations(timeout: timeout, handler: nil)
    }
    
    func assertIsSuccessResultAndNotNil<T, E>(
        _ result: Result<T, E>,
        file: StaticString = #filePath,
        line: UInt = #line
    ) where E: Error {
        switch result {
        case .failure(let error):
            XCTFail("Expected to be a success Result but got a failure with \(error)", file: file, line: line)
        case .success(let value):
            XCTAssertNotNil(value, "Expected to be a success Result with parsed object but got a  nil", file: file, line: line)
        }
    }
}
