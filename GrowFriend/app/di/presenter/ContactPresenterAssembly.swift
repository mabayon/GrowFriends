//
//  ContactPresenterAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping
class ContactPresenterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ContactsListPresenter.self) { resolver in
            ContactsListPresenterImpl(getContacts: resolver.resolve(GetContactsUseCase.self)!,
                                      networkSchedulers: resolver.resolve(NetworkSchedulers.self)!)
        }
    }
}
