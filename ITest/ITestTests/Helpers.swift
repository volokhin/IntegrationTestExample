import Foundation
import XCTest

func waitUntil(timeout: TimeInterval = 5, _ condition: @escaping () -> Bool) {
    let expectation = XCTNSPredicateExpectation(
        predicate: .init(value: true),
        object: nil)

    expectation.handler = { condition() }

    let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
    XCTAssert(result == .completed, "Failed to wait for \(timeout) sec")
}
