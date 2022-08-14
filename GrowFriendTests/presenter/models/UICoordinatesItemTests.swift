import XCTest

@testable import GrowFriend

class UICoordinatesItemTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainCoordinatesUtils.createMale()
        let actualItem = PresenterFixtures.UICoordinatesItemUtils.createMale()
        XCTAssertEqual(actualItem.toDomain(), expectedDomain)
    }
}
