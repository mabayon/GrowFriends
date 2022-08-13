//
//  DomainError.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 13/08/2022.
//

import Foundation

protocol DomainError: Error {
    var errorMessage: String { get }
}

extension DomainError {
    func toUIItem() -> UIErrorItem {
        UIErrorItem(errorMessage: errorMessage)
    }
}

struct DomainNetworkException: DomainError, Equatable {
    let code: Int
    let errorMessage: String
}

struct DomainAPIDecodeException: DomainError, Equatable {
    let errorMessage: String
}
