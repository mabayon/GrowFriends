//
//  UICoordinatesItem.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import Foundation

struct UICoordinatesItem: Equatable {
    let latitude: String
    let longitude: String
}

extension UICoordinatesItem {
    func toDomain() -> DomainCoordinates {
        DomainCoordinates(latitude: latitude, longitude: longitude)
    }
}
