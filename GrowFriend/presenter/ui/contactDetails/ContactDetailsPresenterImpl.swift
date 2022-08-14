import Foundation

protocol ContactDetailsView: AnyObject {
    func onBind(item: UIContactItem)
    func onShowCallApp(phoneNumber: String)
    func onShowEmailApp(email: String)
}

protocol ContactDetailsPresenter {
    func attach(_ view: ContactDetailsView)
    func setup(item: UIContactItem)
    func didTapCall()
    func didTapEmail()
}

class ContactDetailsPresenterImpl: ContactDetailsPresenter {
    private weak var view: ContactDetailsView?

    var item: UIContactItem?

    func attach(_ view: ContactDetailsView) {
        self.view = view
    }
    
    func setup(item: UIContactItem) {
        self.item = item
        view?.onBind(item: item)
    }

    func didTapCall() {
        guard let item = item else { return }
        
        view?.onShowCallApp(phoneNumber: item.phone)
    }
    
    func didTapEmail() {
        guard let item = item else { return }
        
        view?.onShowEmailApp(email: item.email)
    }
}
