//
//  NameResponseTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import XCTest

@testable import GrowFriend

class NameResponseTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainNameUtils.createMale()
        let actualResponse = DataFixtures.NameResponseUtils.createMale()
        XCTAssertEqual(actualResponse.toDomain(), expectedDomain)
    }
}
