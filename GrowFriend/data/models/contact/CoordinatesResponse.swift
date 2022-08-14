//
//  CoordinatesResponse.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import Foundation

struct CoordinatesResponse: Decodable, Equatable {
    let latitude: String
    let longitude: String
}

extension CoordinatesResponse {
    func toDomain() -> DomainCoordinates {
        DomainCoordinates(latitude: latitude, longitude: longitude)
    }
}
