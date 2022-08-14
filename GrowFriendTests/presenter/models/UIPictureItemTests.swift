import XCTest

@testable import GrowFriend

class UIPictureItemTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainPictureUtils.createMale()
        let actualItem = PresenterFixtures.UIPictureItemUtils.createMale()
        XCTAssertEqual(actualItem.toDomain(), expectedDomain)
    }
}
