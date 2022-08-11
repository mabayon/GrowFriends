//
//  DomainNameTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import XCTest

@testable import GrowFriend

class DomainNameTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = PresenterFixtures.UINameItemUtils.createFemale()
        let actualDomain = DomainFixtures.DomainNameUtils.createFemale()
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
