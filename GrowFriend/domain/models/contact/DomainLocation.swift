//
//  DomainLocation.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import Foundation

struct DomainLocation: Equatable, Codable {
    let street: DomainStreet
    let city: String
    let country: String
    let coordinates: DomainCoordinates
}

extension DomainLocation {
    func toUIItem() -> UILocationItem {
        UILocationItem(street: street.toUIItem(), city: city, country: country, coordinates: coordinates.toUIItem())
    }
}
