import XCTest

@testable import GrowFriend

class StreetResponseTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainStreetUtils.createMale()
        let actualResponse = DataFixtures.StreetResponseUtils.createMale()
        XCTAssertEqual(actualResponse.toDomain(), expectedDomain)
    }
}
