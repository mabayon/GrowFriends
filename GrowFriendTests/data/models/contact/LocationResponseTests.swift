import XCTest

@testable import GrowFriend

class LocationResponseTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainLocationUtils.createMale()
        let actualResponse = DataFixtures.LocationResponseUtils.createMale()
        XCTAssertEqual(actualResponse.toDomain(), expectedDomain)
    }
}
