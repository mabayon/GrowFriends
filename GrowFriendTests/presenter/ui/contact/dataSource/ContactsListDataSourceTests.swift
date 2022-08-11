//
//  ContactsListDataSourceTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Cuckoo
import Foundation
import XCTest

@testable import GrowFriend

class ContactsListDataSourceTests: XCTestCase {
    private let tableView = UITableView()
    private let dataSource = ContactsListDataSource()
    private let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts

    override func setUp() {
        tableView.registerReusableCell(ContactCardCell.self)
        dataSource.updateData(newItems: expectedItems)
    }
    
    override func tearDown() {
        dataSource.updateData(newItems: [])
    }
    
    func testNumberOfRowsInSection() {
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), expectedItems.count)
    }
    
    func testCellForRowAt() {
        XCTAssertTrue(dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) is ContactCardCell)
    }
}
