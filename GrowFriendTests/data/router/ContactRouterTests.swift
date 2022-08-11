import Foundation
import Moya
import XCTest

@testable import GrowFriend

class ContactRouterTests: XCTestCase {
    func testGetContacts() {
        let route = ContactRouter.getContacts(num: 1)

        XCTAssertEqual(route.method, .get)
        XCTAssertEqual(route.path, "/api/")
        XCTAssertEqual(route.task, .requestParameters(parameters: ["results": "1"], encoding: URLEncoding.default))
        XCTAssertEqual(route.headers, ["Content-Type": "application/json"])
    }
}
