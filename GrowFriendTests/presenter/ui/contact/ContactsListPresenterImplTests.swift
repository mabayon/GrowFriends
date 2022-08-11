import Cuckoo
import RxSwift
import XCTest

@testable import GrowFriend

class ContactsListPresenterImplTests: XCTestCase {
    @InjectMock private var mockGetContacts: MockGetContactsUseCase
    @InjectMock private var testNetworkSchedulers: TestNetworkSchedulers

    private let mockView = MockContactsListView()

    private var presenter: ContactsListPresenter!

    override func setUp() {
        stub(mockView) { stub in
            when(stub).onShowContacts(items: any()).thenDoNothing()
        }

        presenter = ContactsListPresenterImpl(getContacts: mockGetContacts,
                                              networkSchedulers: testNetworkSchedulers)
        presenter.attach(mockView)
    }

    override func tearDown() {
        verifyNoMoreInteractions(mockView)
    }
    
    func testGetContactsList() {
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts

        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(actualDomain))
        }
        
        presenter.getContactsList()
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockView).onShowContacts(items: equal(to: expectedItems))
    }
}
