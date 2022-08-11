//
//  TestAppComponent.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 09/08/2022.
//

import Foundation
import Swinject

@testable import GrowFriend

extension Assembler {
    static let testShared: Assembler = {
        let container = Container()
        let assembler = Assembler([
        ], container: container)
        return assembler
    }()

    // MARK: Utils

    static func InjectMock<Service>(_ serviceType: Service.Type, name: String? = nil) -> Service {
        Assembler.testShared.resolver.resolve(serviceType, name: name)!
    }
}

@propertyWrapper struct InjectMock<Service> {
    private var service: Service

    public init(named name: String? = nil) {
        self.service = Assembler.InjectMock(Service.self, name: name)
    }

    public var wrappedValue: Service {
        get { service }
        mutating set { service = newValue }
    }

    public var projectedValue: InjectMock<Service> {
        get { self }
        mutating set { self = newValue }
    }
}
