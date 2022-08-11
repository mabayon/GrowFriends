//
//  RouterAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping function_body_length
class RouterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UnprotectedMoyaProvider<ContactRouter>.self) { resolver in
            UnprotectedMoyaProvider<ContactRouter>(
                session: resolver.resolve(UnprotectedSession.self)!
            )
        }
    }
}
