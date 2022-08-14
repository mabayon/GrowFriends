//
//  DomainCoordinates.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import Foundation

struct DomainCoordinates: Equatable, Codable {
    let latitude: String
    let longitude: String
}

extension DomainCoordinates {
    func toUIItem() -> UICoordinatesItem {
        UICoordinatesItem(latitude: latitude, longitude: longitude)
    }
}
