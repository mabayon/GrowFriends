//
//  PictureResponseTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import XCTest

@testable import GrowFriend

class PictureResponseTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainFixtures.DomainPictureUtils.createMale()
        let actualResponse = DataFixtures.PictureResponseUtils.createMale()
        XCTAssertEqual(actualResponse.toDomain(), expectedDomain)
    }
}
