//
//  RouterAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

class RouterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UnprotectedMoyaProvider<ContactRouter>.self) { resolver in
            UnprotectedMoyaProvider<ContactRouter>(
                session: resolver.resolve(UnprotectedSession.self)!
            )
        }
    }
}
