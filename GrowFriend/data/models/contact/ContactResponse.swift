//
//  ContactResponse.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct ContactResponse: Decodable, Equatable {
    let gender: String
    let name: NameResponse
    let email: String
    let phone: String
    let picture: PictureResponse
}

extension ContactResponse {
    func toDomain() -> DomainContact {
        DomainContact(gender: DomainGender(rawValue: gender) ?? .uninformed,
                      name: name.toDomain(),
                      email: email,
                      phone: phone,
                      picture: picture.toDomain())
    }
}
