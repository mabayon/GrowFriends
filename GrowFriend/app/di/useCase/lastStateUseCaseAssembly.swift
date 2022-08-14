//
//  LocalUseCaseAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 13/08/2022.
//

import Foundation
import Swinject

class lastStateUseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetLastContactsListUseCase.self) { resolver in
            GetLastContactsListUseCase(lastStateRepository: resolver.resolve(LastStateRepository.self)!)
        }
        
        container.register(SetLastContactsListUseCase.self) { resolver in
            SetLastContactsListUseCase(lastStateRepository: resolver.resolve(LastStateRepository.self)!)
        }
    }
}
