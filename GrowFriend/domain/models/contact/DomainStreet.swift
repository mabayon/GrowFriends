//
//  DomainStreet.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import Foundation

struct DomainStreet: Equatable, Codable {
    let number: Int
    let name: String
}

extension DomainStreet {
    func toUIItem() -> UIStreetItem {
        UIStreetItem(number: number, name: name)
    }
}
