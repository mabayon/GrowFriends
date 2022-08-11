//
//  ContactResponseTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import XCTest

@testable import GrowFriend

class ContactResponseTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainContactUtils.createMale()
        let actualResponse = DataFixtures.ContactResponseUtils.createMale()
        XCTAssertEqual(actualResponse.toDomain(), expectedDomain)
    }
}
