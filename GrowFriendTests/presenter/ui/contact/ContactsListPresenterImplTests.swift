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
        verifyNoMoreInteractions(mockGetContacts)
    }
    
    func testGetContactsListWhenEmpty() {
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts

        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(actualDomain))
        }
        
        presenter.getContactsList()
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockView).onShowContacts(items: equal(to: expectedItems))
    }
    
    func testGetContactsListWhenAlreadyFillWithData() {
        let oldData = PresenterFixtures.UIContactListItemUtils.create().contacts
        let newData = PresenterFixtures.UIContactListItemUtils.create().contacts
        
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = oldData + newData

        helperFillTheListWithData()
        
        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(actualDomain))
        }
        
        presenter.getContactsList()
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockView).onShowContacts(items: equal(to: expectedItems))
    }
        
    func testGetContactsListCalledSeveralTimes() {
        let exp = expectation(description: "")
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts
        
        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).then { _ in
                Single<Int>.timer(RxTimeInterval.milliseconds(1), scheduler: MainScheduler.instance).flatMap { _ in
                    Single.just(actualDomain)
                }
            }
        }
        
        presenter.getContactsList()
        presenter.getContactsList()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) { [weak self] in
            guard let self = self else { return }
            verify(self.mockGetContacts).invoke(num: 10)
            verify(self.mockView).onShowContacts(items: equal(to: expectedItems))
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    private func helperFillTheListWithData() {
        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(DomainFixtures.DomainContactListUtils.create()))
        }

        presenter.getContactsList()
        clearInvocations(mockGetContacts)
        clearInvocations(mockView)
    }
}
