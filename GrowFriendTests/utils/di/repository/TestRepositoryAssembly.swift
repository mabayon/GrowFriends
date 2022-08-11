//
//  TestRepositoryAssembly.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Cuckoo
import Foundation
import Swinject

@testable import GrowFriend

class TestRepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MockContactRepository.self) { _ in MockContactRepository() }
    }
}
