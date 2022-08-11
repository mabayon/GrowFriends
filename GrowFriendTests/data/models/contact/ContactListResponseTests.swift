//
//  ContactListResponseTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import XCTest

@testable import GrowFriend

class ContactListResponseTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainContactListUtils.create()
        let actualResponse = DataFixtures.ContactListResponseUtils.create()
        XCTAssertEqual(actualResponse.toDomain(), expectedDomain)
    }
}
