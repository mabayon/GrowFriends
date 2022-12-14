//
//  UINameItem.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct UINameItem: Equatable {
    let first: String
    let last: String
}

extension UINameItem {
    func toDomain() -> DomainName {
        DomainName(first: first, last: last)
    }
}
