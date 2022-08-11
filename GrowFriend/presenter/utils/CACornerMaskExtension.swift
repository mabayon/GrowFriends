//
//  CACornerMaskExtension.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation
import UIKit

extension CACornerMask {
    static let topLeftCorner = layerMinXMinYCorner
    static let topRightCorner = layerMaxXMinYCorner
    static let bottomLeftCorner = layerMinXMaxYCorner
    static let bottomRightCorner = layerMaxXMaxYCorner
}
