//
//  PictureResponse.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct PictureResponse: Decodable, Equatable {
    let large: String
    let medium: String
    let thumbnail: String
}

extension PictureResponse {
    func toDomain() -> DomainPicture {
        DomainPicture(large: large, medium: medium, thumbnail: thumbnail)
    }
}
