import Cuckoo
import Foundation
import RxSwift
import XCTest

@testable import GrowFriend

class ContactServiceApiImplTests: XCTestCase {
    @InjectMock private var mockProvider: MockUnprotectedMoyaProvider<ContactRouter>
    private var serviceApi: ContactServiceApi!

    override func setUp() {
        serviceApi = ContactServiceApiImpl(provider: mockProvider)
    }

    override func tearDown() {
        verifyNoMoreInteractions(mockProvider)
    }
    
    func testGetContacts() {
        let actualResponse = DataFixtures.ContactListResponseUtils.create()
        let expectedRoute = ContactRouter.getContacts(num: 1)
        
        stub(mockProvider) { stub in
            when(stub).createSingle(route: any(), typeOf: any()).thenReturn(Single.just(actualResponse))
        }
        
        serviceApi.getContacts(num: 1)
            .test()
            .assertValue(value: actualResponse)
        
        verify(mockProvider).createSingle(route: equal(to: expectedRoute), typeOf: ParameterMatcher(matchesFunction: { (_: ContactListResponse.Type) in true }))
    }
}
