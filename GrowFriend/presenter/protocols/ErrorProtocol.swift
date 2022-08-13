//
//  ErrorProtocol.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 13/08/2022.
//

import Foundation

protocol ErrorProtocol: AnyObject {
    func onReceiveError(_ error: Error)
    func onReceiveNetworkError(_ error: UIErrorItem)
}

extension ErrorProtocol {
    func onReceiveNetworkError(_ error: UIErrorItem) {}

    func onReceiveError(_ error: Error) {
        switch error {
        case let error as DomainNetworkException:
            self.onReceiveNetworkError(error.toUIItem())
        default: assertionFailure("Unprocessed error")
        }
    }
}
