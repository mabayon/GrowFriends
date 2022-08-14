import XCTest

@testable import GrowFriend

class CoordinatesResponseTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainCoordinatesUtils.createMale()
        let actualResponse = DataFixtures.CoordinatesResponseUtils.createMale()
        XCTAssertEqual(actualResponse.toDomain(), expectedDomain)
    }
}
