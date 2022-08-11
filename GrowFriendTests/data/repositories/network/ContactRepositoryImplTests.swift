//
//  ContactRepositoryImplTests.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Cuckoo
import RxSwift
import RxBlocking
import XCTest

@testable import GrowFriend

class ContactRepositoryImplTests: XCTestCase {
    @InjectMock private var mockContactServiceApi: MockContactServiceApi
    
    private var repository: ContactRepository!
    
    override func setUp() {
        super.setUp()
        repository = ContactRepositoryImpl(contactServiceApi: mockContactServiceApi)
    }
    
    override func tearDown() {
        super.tearDown()
        verifyNoMoreInteractions(mockContactServiceApi)
    }
    
    func testGetContacts() {
        let expectedDomain = DomainFixtures.DomainContactListUtils.create()
        let actualResponse = DataFixtures.ContactListResponseUtils.create()
        
        stub(mockContactServiceApi) { stub in
            when(stub).getContacts(num: any()).thenReturn(Single.just(actualResponse))
        }
        
        repository.getContacts(num: 1)
            .test()
            .assertValue(value: expectedDomain)
        
        verify(mockContactServiceApi).getContacts(num: 1)
    }
}
