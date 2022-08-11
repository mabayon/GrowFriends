//
//  ViewControllerDescriptible.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 09/08/2022.
//

import UIKit

protocol ViewControllerDescriptible {}

extension ViewControllerDescriptible where Self: UIViewController {
    static var name: String { String(describing: self) }
}

extension UIViewController: ViewControllerDescriptible {}
