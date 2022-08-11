//
//  DomainContactListTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import XCTest

@testable import GrowFriend

class DomainContactListTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = PresenterFixtures.UIContactListItemUtils.create()
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
