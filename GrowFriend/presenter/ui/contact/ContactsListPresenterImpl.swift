//
//  ContactsListPresenterImpl.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import RxSwift

protocol ContactsListView: ErrorProtocol {
    func onShowContacts(items: [UIContactItem])
    func onShowEmptyList()
    func onStartLoading()
    func onStopLoading()
}

protocol ContactsListPresenter {
    func attach(_ view: ContactsListView)
    func getContactsList(shouldReset: Bool)
}

class ContactsListPresenterImpl: ContactsListPresenter, DisposeProvider {
    private let getContacts: GetContactsUseCase
    private let getLastContactsList: GetLastContactsListUseCase
    private let setLastContactsList: SetLastContactsListUseCase
    private let networkSchedulers: NetworkSchedulers

    private weak var view: ContactsListView?
    let disposeBag = DisposeBag()
    
    private var currentItems: [UIContactItem] = []

    private var isFetchInProgress = false
    
    init(getContacts: GetContactsUseCase,
         getLastContactsList: GetLastContactsListUseCase,
         setLastContactsList: SetLastContactsListUseCase,
         networkSchedulers: NetworkSchedulers) {
        self.getContacts = getContacts
        self.getLastContactsList = getLastContactsList
        self.setLastContactsList = setLastContactsList
        self.networkSchedulers = networkSchedulers
    }

    func attach(_ view: ContactsListView) {
        self.view = view
    }
    
    func getContactsList(shouldReset: Bool) {
        guard !isFetchInProgress else { return }

        isFetchInProgress = true
        view?.onStartLoading()

        getContacts.invoke()
            .map { $0.toUIItem() }
            .subscribe(on: networkSchedulers.io)
            .observe(on: networkSchedulers.main)
            .subscribe(onSuccess: { [weak self] item in
                guard let self = self else { return }
                self.isFetchInProgress = false
                shouldReset
                ? self.currentItems = item.contacts
                : self.currentItems.append(contentsOf: item.contacts)
                self.setLastContactsList.invoke(newValue: self.currentItems.map { $0.toDomain() })
                self.view?.onShowContacts(items: self.currentItems)
            }, onFailure: { [weak self] error in
                guard let self = self else { return }
                self.currentItems = self.getLastContactsList.invoke().map { $0.toUIItem() }
                
                if self.currentItems.isEmpty {
                    self.view?.onShowEmptyList()
                } else {
                    self.view?.onShowContacts(items: self.currentItems)
                    self.view?.onReceiveError(error)
                }
                self.view?.onStopLoading()
                self.isFetchInProgress = false
            })
            .disposed(by: disposeBag)
    }
}
