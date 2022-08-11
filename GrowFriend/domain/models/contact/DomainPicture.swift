//
//  DomainPicture.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct DomainPicture: Equatable {
    let large: String
    let medium: String
    let thumbnail: String
}

extension DomainPicture {
    func toUIItem() -> UIPictureItem {
        UIPictureItem(large: large, medium: medium, thumbnail: thumbnail)
    }
}
