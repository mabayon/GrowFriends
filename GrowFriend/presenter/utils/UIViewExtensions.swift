//
//  UIViewExtensions.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation
import UIKit

extension UIView {
    func applyRounded(at corners: CACornerMask? = nil, cornerRadius: CGFloat = 16.0) {
        if let corners = corners { layer.maskedCorners = corners }
        layer.cornerRadius = cornerRadius
    }

    func applyShadow(
        shadowOffset: CGSize = .zero,
        shadowRadius: CGFloat = 4.0
    ) {
        layer.masksToBounds = false
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = 0.3
        layer.shadowRadius = shadowRadius
        layer.shadowColor = UIColor.gray.cgColor
    }
}
