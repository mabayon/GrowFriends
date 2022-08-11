//
//  DomainContactTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import XCTest

@testable import GrowFriend

class DomainContactTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = PresenterFixtures.UIContactItemUtils.createMale()
        let actualDomain = DomainFixtures.DomainContactUtils.createMale()
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
