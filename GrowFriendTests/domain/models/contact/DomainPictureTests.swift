//
//  DomainPictureTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import XCTest

@testable import GrowFriend

class DomainPictureTests: XCTestCase {
    func testToUIItem() {
        let expectedItem = PresenterFixtures.UIPictureItemUtils.createFemale()
        let actualDomain = DomainFixtures.DomainPictureUtils.createFemale()
        XCTAssertEqual(actualDomain.toUIItem(), expectedItem)
    }
}
