//
//  SessionsAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

class SessionsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UnprotectedSession.self) { _ in
            UnprotectedSession()
        }.inObjectScope(.container)
    }
}
