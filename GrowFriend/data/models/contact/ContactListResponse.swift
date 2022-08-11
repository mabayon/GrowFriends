//
//  ContactListResponse.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct ContactListResponse: Decodable, Equatable {
    let contacts: [ContactResponse]
    
    enum CodingKeys : String, CodingKey {
        case contacts = "results"
    }
}

extension ContactListResponse {
    func toDomain() -> DomainContactList {
        DomainContactList(contacts: contacts.map { $0.toDomain() })
    }
}
