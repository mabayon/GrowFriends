import Cuckoo
import XCTest

@testable import GrowFriend

class GetLastContactsListUseCaseTests: XCTestCase {
    @InjectMock private var mockLastStateRepository: MockLastStateRepository
    
    private var useCase: GetLastContactsListUseCase!

    override func setUp() {
        useCase = GetLastContactsListUseCase(lastStateRepository: mockLastStateRepository)
    }

    override func tearDown() {
        verifyNoMoreInteractions(mockLastStateRepository)
    }

    func testInvoke() {
        let expectedDomain = DomainFixtures.DomainContactListUtils.create().contacts
        
        stub(mockLastStateRepository) { stub in
            when(stub).getContactsList().thenReturn(expectedDomain)
        }

        XCTAssertEqual(useCase.invoke(), expectedDomain)

        verify(mockLastStateRepository).getContactsList()
    }
}
