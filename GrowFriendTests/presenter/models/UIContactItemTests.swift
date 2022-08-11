//
//  UIContactItemTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import XCTest

@testable import GrowFriend

class UIContactItemTests: XCTestCase {
    func testGetImage() {
        XCTAssertEqual(UIGenderItem.male.getImage(), UIImage(named: "male"))
        XCTAssertEqual(UIGenderItem.female.getImage(), UIImage(named: "female"))
        XCTAssertEqual(UIGenderItem.uninformed.getImage(), UIImage(named: "uninformed"))
    }
}
