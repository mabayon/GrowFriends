//
//  Reusable.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import UIKit

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String { String(describing: Self.self) }
}
