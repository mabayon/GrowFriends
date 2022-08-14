//
//  UILocationItem.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import Foundation

struct UILocationItem: Equatable {
    let street: UIStreetItem
    let city: String
    let country: String
    let coordinates: UICoordinatesItem
    
    func getFormattedAddress() -> String {
        "\(street.number) \(street.name) \(city) - \(country)"
    }
}

extension UILocationItem {
    func toDomain() -> DomainLocation {
        DomainLocation(street: street.toDomain(),
                       city: city,
                       country: country,
                       coordinates: coordinates.toDomain())
    }
}
