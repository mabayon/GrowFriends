//
//  DomainName.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct DomainName: Equatable {
    let first: String
    let last: String
}

extension DomainName {
    func toUIItem() -> UINameItem {
        UINameItem(first: first, last: last)
    }
}
