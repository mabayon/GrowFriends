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
    private let mockContactsListDelegate = MockContactsListDelegate()
    private let tableView = UITableView()
    private let dataSource = ContactsListDataSource()
    private let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts

    override func setUp() {
        tableView.registerReusableCell(ContactCardCell.self)
        dataSource.delegate = mockContactsListDelegate
        dataSource.updateData(newItems: expectedItems)
    }
    
    override func tearDown() {
        tableView.delegate = nil
        dataSource.updateData(newItems: [])
        verifyNoMoreInteractions(mockContactsListDelegate)
    }
    
    func testNumberOfRowsInSectionWhenItemsEmpty() {
        dataSource.updateData(newItems: [])
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 10)
    }

    func testNumberOfRowsInSectionWhenItemsNotEmpty() {
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), expectedItems.count + 1)
    }
    
    func testCellForRowAt() {
        XCTAssertTrue(dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) is ContactCardCell)
    }
    
    
    func testDidSelectRowAt() {
        stub(mockContactsListDelegate) { stub in
            when(stub).didSelectItem(item: any()).thenDoNothing()
        }

        dataSource.delegate = mockContactsListDelegate
        dataSource.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        verify(mockContactsListDelegate).didSelectItem(item: ParameterMatcher(matchesFunction: { selectedRow in
            selectedRow == self.expectedItems[0]
        }))
        verifyNoMoreInteractions(mockContactsListDelegate)
    }
}
