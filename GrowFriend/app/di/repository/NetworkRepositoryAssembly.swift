//
//  NetworkRepositoryAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

class NetworkRepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ContactRepository.self) { resolver in
            ContactRepositoryImpl(contactServiceApi: resolver.resolve(ContactServiceApi.self)!)
        }
    }
}
