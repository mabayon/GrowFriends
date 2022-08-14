//
//  LocationResponse.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import Foundation

struct LocationResponse: Decodable, Equatable {
    let street: StreetResponse
    let city: String
    let country: String
    let coordinates: CoordinatesResponse
}

extension LocationResponse {
    func toDomain() -> DomainLocation {
        DomainLocation(street: street.toDomain(), city: city, country: country, coordinates: coordinates.toDomain())
    }
}
