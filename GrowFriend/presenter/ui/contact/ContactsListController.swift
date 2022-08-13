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
        presenter.getContactsList(shouldReset: true)
    }
    
    private func setupTableView() {
        dataSource.delegate = self

        tableView.dataSource = dataSource
        tableView.prefetchDataSource = dataSource
        
        tableView.separatorStyle = .none
        tableView.registerReusableCell(ContactCardCell.self)
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: [.foregroundColor: UIColor.black])
        refreshControl?.tintColor = .black
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        presenter.getContactsList(shouldReset: true)
    }
}

extension ContactsListController: ContactsListView {
    func onShowContacts(items: [UIContactItem]) {
        dataSource.updateData(newItems: items)
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func onStopLoading() {
        refreshControl?.endRefreshing()
    }
    
    func onReceiveNetworkError(_ error: UIErrorItem) {
        let alertController = UIAlertController(title: "Warning",
                                                message: "Check your connection 😥", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
}

extension ContactsListController: ContactsListDelegate {
    func fetchNewContacts() {
        presenter.getContactsList(shouldReset: false)
    }
}
