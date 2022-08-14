import Cuckoo
import XCTest

@testable import GrowFriend

class ContactDetailsPresenterImplTests: XCTestCase {
    private let mockView = MockContactDetailsView()
    private let item = PresenterFixtures.UIContactItemUtils.createMale()
    
    private var presenter: ContactDetailsPresenter!

    override func setUp() {
        stub(mockView) { stub in
            when(stub).onBind(item: any()).thenDoNothing()
            when(stub).onShowCallApp(phoneNumber: any()).thenDoNothing()
            when(stub).onShowEmailApp(email: any()).thenDoNothing()
        }

        presenter = ContactDetailsPresenterImpl()
        presenter.attach(mockView)
        presenter.setup(item: item)
        clearInvocations(mockView)
    }

    override func tearDown() {
        verifyNoMoreInteractions(mockView)
    }
        
    func testSetup() {
        presenter.setup(item: item)
        
        verify(mockView).onBind(item: equal(to: item))
    }

    func testDidTapCall() {
        presenter.didTapCall()
        
        verify(mockView).onShowCallApp(phoneNumber: equal(to: item.phone))
    }
    
    func testDidTapEmail() {
        presenter.didTapEmail()
        
        verify(mockView).onShowEmailApp(email: equal(to: item.email))
    }
}
