//
//  DomainContact.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct DomainContact: Equatable {
    let gender: DomainGender
    let name: DomainName
    let email: String
    let phone: String
    let picture: DomainPicture
}

extension DomainContact {
    func toUIItem() -> UIContactItem {
        UIContactItem(gender: gender.toUIItem(),
                      name: name.toUIItem(),
                      email: email,
                      phone: phone,
                      picture: picture.toUIItem())
    }
}
