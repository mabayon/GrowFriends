//
//  ContactsListDataSource.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation
import UIKit

class ContactsListDataSource: NSObject, UITableViewDataSource {
    private var currentsItems: [UIContactItem] = []

    weak var delegate: ContactsListDelegate?

    func updateData(newItems: [UIContactItem]) {
        currentsItems = newItems
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // +1 for the loading cell
        currentsItems.isEmpty ? 10 : currentsItems.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as ContactCardCell
        
        if isLoadingCell(for: indexPath) || currentsItems.isEmpty {
            cell.onBind(item: .none)
        } else {
            cell.onBind(item: currentsItems[indexPath.row])
        }

        return cell
    }
    
    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        indexPath.row == currentsItems.count
    }
}

extension ContactsListDataSource: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            delegate?.fetchNewContacts()
        }
    }
}
