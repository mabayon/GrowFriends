//
//  ContactsListControllerTableViewController.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import UIKit

class ContactsListController: UITableViewController {

    @Inject private var presenter: ContactsListPresenter
    @Inject private var dataSource: ContactsListDataSource

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 244/255, alpha: 1)
        setupTableView()

        presenter.attach(self)
        presenter.getContactsList()
    }
    
    private func setupTableView() {
        tableView.dataSource = dataSource
        
        tableView.separatorStyle = .none
        tableView.registerReusableCell(ContactCardCell.self)
    }
}

extension ContactsListController: ContactsListView {
    func onShowContacts(items: [UIContactItem]) {
        dataSource.updateData(newItems: items)
        tableView.reloadData()
    }
}