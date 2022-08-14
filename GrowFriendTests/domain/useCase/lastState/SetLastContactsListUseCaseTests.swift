import Cuckoo
import XCTest

@testable import GrowFriend

class SetLastContactsListUseCaseTests: XCTestCase {
    @InjectMock private var mockLastStateRepository: MockLastStateRepository
    
    private var useCase: SetLastContactsListUseCase!

    override func setUp() {
        useCase = SetLastContactsListUseCase(lastStateRepository: mockLastStateRepository)
    }

    override func tearDown() {
        verifyNoMoreInteractions(mockLastStateRepository)
    }

    func testInvoke() {
        let expectedDomain = DomainFixtures.DomainContactListUtils.create().contacts

        stub(mockLastStateRepository) { stub in
            when(stub).setContactsList(newValue: any()).thenDoNothing()
        }
        
        useCase.invoke(newValue: expectedDomain)

        verify(mockLastStateRepository).setContactsList(newValue: equal(to: expectedDomain))
    }
}
