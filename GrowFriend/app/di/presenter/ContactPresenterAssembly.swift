//
//  ContactPresenterAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

class ContactPresenterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ContactsListPresenter.self) { resolver in
            ContactsListPresenterImpl(getContacts: resolver.resolve(GetContactsUseCase.self)!,
                                      getLastContactsList: resolver.resolve(GetLastContactsListUseCase.self)!,
                                      setLastContactsList: resolver.resolve(SetLastContactsListUseCase.self)!,
                                      networkSchedulers: resolver.resolve(NetworkSchedulers.self)!)
        }
        
        container.register(ContactDetailsPresenter.self) { _ in
            ContactDetailsPresenterImpl()
        }
    }
}
