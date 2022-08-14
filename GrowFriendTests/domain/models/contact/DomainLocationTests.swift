import XCTest

@testable import GrowFriend

class DomainLocationTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = PresenterFixtures.UILocationItemUtils.createMale()
        let actualDomain = DomainFixtures.DomainLocationUtils.createMale()
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
