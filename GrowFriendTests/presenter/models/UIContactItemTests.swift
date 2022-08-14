import XCTest

@testable import GrowFriend

class UIContactItemTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainContactUtils.createMale()
        let actualItem = PresenterFixtures.UIContactItemUtils.createMale()
        XCTAssertEqual(actualItem.toDomain(), expectedDomain)
    }
}
