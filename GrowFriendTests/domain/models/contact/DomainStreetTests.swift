import XCTest

@testable import GrowFriend

class DomainStreetTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = PresenterFixtures.UIStreetItemUtils.createMale()
        let actualDomain = DomainFixtures.DomainStreetUtils.createMale()
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
