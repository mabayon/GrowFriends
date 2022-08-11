import XCTest

@testable import GrowFriend

class DomainGenderTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = UIGenderItem.female
        let actualDomain = DomainGender.female
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
