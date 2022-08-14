//
//  DomainContact.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct DomainContact: Equatable, Codable {
    let gender: DomainGender
    let name: DomainName
    let email: String
    let phone: String
    let picture: DomainPicture
    let location: DomainLocation
}

extension DomainContact {
    func toUIItem() -> UIContactItem {
        UIContactItem(gender: gender.toUIItem(),
                      name: name.toUIItem(),
                      email: email,
                      phone: phone,
                      picture: picture.toUIItem(),
                      location: location.toUIItem())
    }
}
