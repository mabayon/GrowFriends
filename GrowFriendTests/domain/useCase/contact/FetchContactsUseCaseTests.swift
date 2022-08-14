import Cuckoo
import RxSwift
import XCTest

@testable import GrowFriend

class GetContactsUseCaseTests: XCTestCase {
    @InjectMock private var mockContactRepository: MockContactRepository
    private var useCase: GetContactsUseCase!

    override func setUp() {
        useCase = GetContactsUseCase(contactRepository: mockContactRepository)
    }

    override func tearDown() {
        verifyNoMoreInteractions(mockContactRepository)
    }
    
    func testInvoke() {
        let expectedNum = 10
        let expectedDomain = DomainFixtures.DomainContactListUtils.create()
        
        stub(mockContactRepository) { stub in
            when(stub).getContacts(num: any()).thenReturn(Single.just(expectedDomain))
        }
        
        useCase.invoke(num: expectedNum)
            .test()
            .assertValue(value: expectedDomain)
        
        verify(mockContactRepository).getContacts(num: equal(to: expectedNum))
    }
}
