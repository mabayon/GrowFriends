//
//  TestUseCaseAssembly.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Cuckoo
import Foundation
import Swinject

@testable import GrowFriend

class TestUseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MockGetContactsUseCase.self) { resolver in
            MockGetContactsUseCase(contactRepository: resolver.resolve(MockContactRepository.self)!)
        }
    }
}
