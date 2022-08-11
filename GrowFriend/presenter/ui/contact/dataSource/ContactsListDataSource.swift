//
//  ContactsListDataSource.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation
import UIKit

class ContactsListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var currentsItems: [UIContactItem] = []

    func updateData(newItems: [UIContactItem]) {
        currentsItems = newItems
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentsItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as ContactCardCell
        cell.onBind(item: currentsItems[indexPath.row])
        return cell
    }
}
