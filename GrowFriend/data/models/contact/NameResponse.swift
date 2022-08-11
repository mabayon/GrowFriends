//
//  NameResponse.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct NameResponse: Decodable, Equatable {
    let first: String
    let last: String
}

extension NameResponse {
    func toDomain() -> DomainName {
        DomainName(first: first, last: last)
    }
}
