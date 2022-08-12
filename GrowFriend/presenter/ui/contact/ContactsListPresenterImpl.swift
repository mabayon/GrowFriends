//
//  ContactsListPresenterImpl.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import RxSwift

protocol ContactsListView: AnyObject {
    func onShowContacts(items: [UIContactItem])
}

protocol ContactsListPresenter {
    func attach(_ view: ContactsListView)
    func getContactsList()
}

class ContactsListPresenterImpl: ContactsListPresenter, DisposeProvider {
    private let getContacts: GetContactsUseCase
    private let networkSchedulers: NetworkSchedulers

    private weak var view: ContactsListView?
    let disposeBag = DisposeBag()
    
    private var currentItems: [UIContactItem] = []

    private var isFetchInProgress = false
    
    init(getContacts: GetContactsUseCase, networkSchedulers: NetworkSchedulers) {
        self.getContacts = getContacts
        self.networkSchedulers = networkSchedulers
    }

    func attach(_ view: ContactsListView) {
        self.view = view
    }
    
    func getContactsList() {
        guard !isFetchInProgress else { return }

        isFetchInProgress = true

        getContacts.invoke()
            .map { $0.toUIItem() }
            .subscribe(on: networkSchedulers.io)
            .observe(on: networkSchedulers.main)
            .subscribe(onSuccess: { [weak self] item in
                guard let self = self else { return }
                self.isFetchInProgress = false
                self.currentItems.append(contentsOf: item.contacts)
                self.view?.onShowContacts(items: self.currentItems)
            })
            .disposed(by: disposeBag)
    }
}
