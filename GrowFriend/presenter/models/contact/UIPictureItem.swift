//
//  UIPictureItem.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct UIPictureItem: Equatable {
    let large: String
    let medium: String
    let thumbnail: String
}

extension UIPictureItem {
    func toDomain() -> DomainPicture {
        DomainPicture(large: large, medium: medium, thumbnail: thumbnail)
    }
}
