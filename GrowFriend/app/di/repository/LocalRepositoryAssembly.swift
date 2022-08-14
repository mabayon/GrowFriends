//
//  LocalRepositoryAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 13/08/2022.
//

import Foundation
import Swinject

class LocalRepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LastStateRepository.self) { _ in
            LastStateRepositoryImpl(userDefaults: UserDefaults(suiteName: "last_state")!)
        }
    }
}
