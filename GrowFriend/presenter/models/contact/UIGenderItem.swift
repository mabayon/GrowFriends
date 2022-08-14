//
//  UIGenderItem.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation
import UIKit

enum UIGenderItem {
    case male
    case female
    case uninformed
}

extension UIGenderItem {
    func toDomain() -> DomainGender {
        switch self {
        case .male: return .male
        case .female: return .female
        case .uninformed: return .uninformed
        }
    }
    
    func getImage() -> UIImage? {
        switch self {
        case .male: return UIImage(named: "male")
        case .female: return UIImage(named: "female")
        case .uninformed: return UIImage(named: "uninformed")
        }
    }
}
