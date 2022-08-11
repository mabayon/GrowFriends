//
//  TestNetworkAssembly.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Cuckoo
import Foundation
import Swinject

@testable import GrowFriend

class TestNetworkAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: Sessions
        container.register(MockUnprotectedSession.self) { _ in MockUnprotectedSession() }
        
        // MARK: Provider
        container.register(MockUnprotectedMoyaProvider<ContactRouter>.self) { resolver in
            MockUnprotectedMoyaProvider<ContactRouter>(
                session: resolver.resolve(MockUnprotectedSession.self)!
            )
        }
        
        // MARK: Service API
        container.register(MockContactServiceApi.self) { _ in MockContactServiceApi() }
    }
}
