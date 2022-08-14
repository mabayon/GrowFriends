import XCTest

@testable import GrowFriend

class UILocationItemTests: XCTestCase {
    func testGetFormattedAddress() {
        let actualItem = PresenterFixtures.UILocationItemUtils.createMale()
        let expectedAddress = "1547 Stanley Way Aylmer - Canada"
        
        XCTAssertEqual(actualItem.getFormattedAddress(), expectedAddress)
    }

    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainLocationUtils.createMale()
        let actualItem = PresenterFixtures.UILocationItemUtils.createMale()
        XCTAssertEqual(actualItem.toDomain(), expectedDomain)
    }
}
