//
//  ContactUseCaseAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

class ContactUseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetContactsUseCase.self) { resolver in
            GetContactsUseCase(contactRepository: resolver.resolve(ContactRepository.self)!)
        }
    }
}
