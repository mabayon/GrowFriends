import Cuckoo
import RxSwift
import XCTest

@testable import GrowFriend

class ContactsListPresenterImplTests: XCTestCase {
    @InjectMock private var mockGetContacts: MockGetContactsUseCase
    @InjectMock private var mockGetLastContactsList: MockGetLastContactsListUseCase
    @InjectMock private var mockSetLastContactsList: MockSetLastContactsListUseCase
    @InjectMock private var testNetworkSchedulers: TestNetworkSchedulers

    private let mockView = MockContactsListView()

    private var presenter: ContactsListPresenter!

    override func setUp() {
        stub(mockView) { stub in
            when(stub).onShowContacts(items: any()).thenDoNothing()
            when(stub).onShowEmptyList().thenDoNothing()
            when(stub).onStartLoading().thenDoNothing()
            when(stub).onStopLoading().thenDoNothing()
            when(stub).onReceiveError(any()).thenDoNothing()
        }

        stub(mockSetLastContactsList) { stub in
            when(stub).invoke(newValue: any()).thenDoNothing()
        }

        presenter = ContactsListPresenterImpl(getContacts: mockGetContacts,
                                              getLastContactsList: mockGetLastContactsList,
                                              setLastContactsList: mockSetLastContactsList,
                                              networkSchedulers: testNetworkSchedulers)
        presenter.attach(mockView)
    }

    override func tearDown() {
        verifyNoMoreInteractions(mockView)
        verifyNoMoreInteractions(mockGetContacts)
        verifyNoMoreInteractions(mockSetLastContactsList)
        verifyNoMoreInteractions(mockGetLastContactsList)
    }
    
    func testGetContactsListWhenEmptyAndShouldNotReset() {
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts
        let expectedDomain = DomainFixtures.DomainContactListUtils.create().contacts

        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(actualDomain))
        }
        
        presenter.getContactsList(shouldReset: false)
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockSetLastContactsList).invoke(newValue: equal(to: expectedDomain))
        verify(mockView).onShowContacts(items: equal(to: expectedItems))
        verify(mockView).onStartLoading()
    }
    
    func testGetContactsListWhenEmptyAndShouldReset() {
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts
        let expectedDomain = DomainFixtures.DomainContactListUtils.create().contacts

        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(actualDomain))
        }
        
        presenter.getContactsList(shouldReset: true)
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockSetLastContactsList).invoke(newValue: equal(to: expectedDomain))
        verify(mockView).onShowContacts(items: equal(to: expectedItems))
        verify(mockView).onStartLoading()
    }
    
    func testGetContactsListWhenAlreadyFillWithDataAndShouldNotReset() {
        let oldData = PresenterFixtures.UIContactListItemUtils.create().contacts
        let newData = PresenterFixtures.UIContactListItemUtils.create().contacts
        
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = oldData + newData
        let expectedDomain = expectedItems.map { $0.toDomain() }
        
        helperFillTheListWithData()
        
        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(actualDomain))
        }
        
        presenter.getContactsList(shouldReset: false)
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockSetLastContactsList).invoke(newValue: equal(to: expectedDomain))
        verify(mockView).onShowContacts(items: equal(to: expectedItems))
        verify(mockView).onStartLoading()
    }
        
    func testGetContactsListWhenAlreadyFillWithDataAndShouldReset() {
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts
        let expectedDomain = expectedItems.map { $0.toDomain() }

        helperFillTheListWithData()

        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(actualDomain))
        }
        
        presenter.getContactsList(shouldReset: true)
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockSetLastContactsList).invoke(newValue: equal(to: expectedDomain))
        verify(mockView).onShowContacts(items: equal(to: expectedItems))
        verify(mockView).onStartLoading()
    }
        
    func testGetContactsListCalledSeveralTimes() {
        let exp = expectation(description: "")
        let actualDomain = DomainFixtures.DomainContactListUtils.create()
        let expectedItems = PresenterFixtures.UIContactListItemUtils.create().contacts
        let expectedDomain = DomainFixtures.DomainContactListUtils.create().contacts
        
        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).then { _ in
                Single<Int>.timer(RxTimeInterval.milliseconds(1), scheduler: MainScheduler.instance).flatMap { _ in
                    Single.just(actualDomain)
                }
            }
        }
        
        presenter.getContactsList(shouldReset: false)
        presenter.getContactsList(shouldReset: false)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) { [weak self] in
            guard let self = self else { return }
            verify(self.mockGetContacts).invoke(num: 10)
            verify(self.mockSetLastContactsList).invoke(newValue: equal(to: expectedDomain))
            verify(self.mockView).onShowContacts(items: equal(to: expectedItems))
            verify(self.mockView).onStartLoading()
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    func testGetContactsListFailureAndLastContactsListEmpty() {
        let actualDomainException = DomainFixtures.DomainErrorUtils.createNetworkException()

        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.error(actualDomainException))
        }
        
        stub(mockGetLastContactsList) { stub in
            when(stub).invoke().thenReturn([])
        }
        presenter.getContactsList(shouldReset: true)
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockGetLastContactsList).invoke()
        verify(mockView).onShowEmptyList()
        verify(mockView).onStartLoading()
        verify(mockView).onStopLoading()
    }
    
    func testGetContactsListFailureAndLastContactsListNotEmpty() {
        let actualDomainException = DomainFixtures.DomainErrorUtils.createNetworkException()
        let expectedDomain = DomainFixtures.DomainContactListUtils.create().contacts
        let expectedItem = PresenterFixtures.UIContactListItemUtils.create().contacts

        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.error(actualDomainException))
        }
        
        stub(mockGetLastContactsList) { stub in
            when(stub).invoke().thenReturn(expectedDomain)
        }
        presenter.getContactsList(shouldReset: true)
        
        verify(mockGetContacts).invoke(num: 10)
        verify(mockGetLastContactsList).invoke()
        verify(mockView).onShowContacts(items: equal(to: expectedItem))
        verify(mockView).onStartLoading()
        verify(mockView).onStopLoading()
        verify(mockView).onReceiveError(ParameterMatcher(matchesFunction: { error in
            error as! DomainNetworkException == actualDomainException
        }))
    }
    
    private func helperFillTheListWithData() {
        stub(mockGetContacts) { stub in
            when(stub).invoke(num: any()).thenReturn(Single.just(DomainFixtures.DomainContactListUtils.create()))
        }

        presenter.getContactsList(shouldReset: false)
        clearInvocations(mockGetContacts)
        clearInvocations(mockSetLastContactsList)
        clearInvocations(mockView)
    }
}
