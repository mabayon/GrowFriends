//
//  AppAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Swinject

class AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkSchedulers.self) { _ in
            NetworkSchedulersImpl()
        }
    }
}
