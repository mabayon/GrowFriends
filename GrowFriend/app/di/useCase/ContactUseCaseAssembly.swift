//
//  ContactUseCaseAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping
class ContactUseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetContactsUseCase.self) { resolver in
            GetContactsUseCase(contactRepository: resolver.resolve(ContactRepository.self)!)
        }
    }
}
