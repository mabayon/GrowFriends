//
//  DomainContactList.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct DomainContactList: Equatable {
    let contacts: [DomainContact]    
}

extension DomainContactList {
    func toUIItem() -> UIContactListItem {
        UIContactListItem(contacts: contacts.map { $0.toUIItem() })
    }
}
