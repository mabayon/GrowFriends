import XCTest

@testable import GrowFriend

class ErrorResponseTests: XCTestCase {
    func testNetworkExceptionToDomain() {
        let expectedDomain = DomainFixtures.DomainErrorUtils.createNetworkException()
        let actualResponse = DataFixtures.DataErrorUtils.createNetworkException()
        XCTAssertEqual(actualResponse.toDomain() as! DomainNetworkException, expectedDomain)
    }
    
    func testAPIDecodeExceptionToDomain() {
        let expectedDomain = DomainFixtures.DomainErrorUtils.createAPIDecodeException()
        let actualResponse = DataFixtures.DataErrorUtils.createAPIDecodeException()
        XCTAssertEqual(actualResponse.toDomain() as! DomainAPIDecodeException, expectedDomain)
    }
}
