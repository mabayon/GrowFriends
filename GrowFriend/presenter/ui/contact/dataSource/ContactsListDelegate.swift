//
//  ContactsListDelegate.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 12/08/2022.
//

import Foundation

protocol ContactsListDelegate: AnyObject {
    func fetchNewContacts()
    func didSelectItem(item: UIContactItem)
}
