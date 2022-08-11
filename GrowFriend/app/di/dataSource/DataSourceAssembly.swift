//
//  DataSourceAssembly.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation
import Swinject

class DataSourceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ContactsListDataSource.self) { _ in
            ContactsListDataSource()
        }
    }
}
