//
//  UIContactItemTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import XCTest

@testable import GrowFriend

class UIGenderItemTests: XCTestCase {
    func testToDomain() {
        let expectedDomain = DomainGender.male
        let actualItem = UIGenderItem.male
        XCTAssertEqual(actualItem.toDomain(), expectedDomain)
    }

    func testGetImage() {
        XCTAssertEqual(UIGenderItem.male.getImage(), UIImage(named: "male"))
        XCTAssertEqual(UIGenderItem.female.getImage(), UIImage(named: "female"))
        XCTAssertEqual(UIGenderItem.uninformed.getImage(), UIImage(named: "uninformed"))
    }
}
