import XCTest

@testable import GrowFriend

class UINameItemTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainNameUtils.createMale()
        let actualItem = PresenterFixtures.UINameItemUtils.createMale()
        XCTAssertEqual(actualItem.toDomain(), expectedDomain)
    }
}
