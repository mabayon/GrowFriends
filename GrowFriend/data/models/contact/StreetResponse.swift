//
//  StreetResponse.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import Foundation

struct StreetResponse: Decodable, Equatable {
    let number: Int
    let name: String
}

extension StreetResponse {
    func toDomain() -> DomainStreet {
        DomainStreet(number: number, name: name)
    }
}
