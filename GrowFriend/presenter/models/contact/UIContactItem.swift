//
//  UIContactItem.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct UIContactItem: Equatable {
    let gender: UIGenderItem
    let name: UINameItem
    let email: String
    let phone: String
    let picture: UIPictureItem
    let location: UILocationItem
}

extension UIContactItem {
    func toDomain() -> DomainContact {
        DomainContact(gender: gender.toDomain(),
                      name: name.toDomain(),
                      email: email,
                      phone: phone,
                      picture: picture.toDomain(),
                      location: location.toDomain())
    }
}
