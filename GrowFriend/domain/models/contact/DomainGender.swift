//
//  DomainGender.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation

enum DomainGender: String {
    case male
    case female
    case uninformed
}

extension DomainGender {
    func toUIItem() -> UIGenderItem {
        switch self {
        case .male: return .male
        case .female: return .female
        case .uninformed: return .uninformed
        }
    }
}
