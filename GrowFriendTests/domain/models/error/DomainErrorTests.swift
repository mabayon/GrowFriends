import XCTest

@testable import GrowFriend

class DomainErrorTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = PresenterFixtures.UIErrorItemUtils.create()
        let actualDomain = DomainFixtures.DomainErrorUtils.createNetworkException()
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
