//
//  ServiceApiNetworkAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Swinject

class ServiceApiAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ContactServiceApi.self) { resolver in
            ContactServiceApiImpl(
                provider: resolver.resolve(UnprotectedMoyaProvider<ContactRouter>.self)!)
        }
    }
}
