//
//  TestAppAssembly.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Cuckoo
import Foundation
import Swinject

@testable import GrowFriend

class TestAppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TestNetworkSchedulers.self) { _ in TestNetworkSchedulers() }
    }
}
