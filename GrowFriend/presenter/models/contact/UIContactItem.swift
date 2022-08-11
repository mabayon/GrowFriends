//
//  UIContactItem.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

struct UIContactItem: Equatable {
    let gender: UIGenderItem
    let name: UINameItem
    let email: String
    let phone: String
    let picture: UIPictureItem
}
