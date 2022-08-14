import XCTest

@testable import GrowFriend

class UIStreetItemTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainStreetUtils.createMale()
        let actualItem = PresenterFixtures.UIStreetItemUtils.createMale()
        XCTAssertEqual(actualItem.toDomain(), expectedDomain)
    }
}
