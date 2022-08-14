import XCTest

@testable import GrowFriend

class DomainCoordinatesTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = PresenterFixtures.UICoordinatesItemUtils.createMale()
        let actualDomain = DomainFixtures.DomainCoordinatesUtils.createMale()
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
