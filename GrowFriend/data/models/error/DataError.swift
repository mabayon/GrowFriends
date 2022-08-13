//
//  DataError.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 13/08/2022.
//

import Foundation

protocol DataError: Error {
    var errorMessage: String { get }
    
    func toDomain() -> DomainError
}

struct DataNetworkException: DataError, Equatable {
    let code: Int
    let errorMessage: String
    
    func toDomain() -> DomainError {
        DomainNetworkException(code: code, errorMessage: errorMessage)
    }
}

struct DataAPIDecodeException: DataError, Equatable {
    let errorMessage: String
    
    func toDomain() -> DomainError {
        DomainAPIDecodeException(errorMessage: errorMessage)
    }
}
