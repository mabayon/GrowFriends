//
//  ContactsListControllerTableViewController.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import UIKit
import SnapKit

class ContactsListController: UITableViewController {
    @Inject private var presenter: ContactsListPresenter
    @Inject private var dataSource: ContactsListDataSource

    static private var backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 244/255, alpha: 1)

    private var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.isHidden = true
        return view
    }()

    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "warning")
        return imageView
    }()

    private let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Something went wrong"
        return label
    }()

    private let infoSubtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "Make sure wifi or cellular data is turned on and then try again"
        return label
    }()

    private let tryAgainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.tintColor = .white
        button.setTitle("Try again", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.applyRounded()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ContactsListController.backgroundColor
        tryAgainButton.addTarget(self, action: #selector(refresh), for: .touchUpInside)

        setupTableView()
        setupConstraints()

        presenter.attach(self)
        presenter.getContactsList(shouldReset: true)
    }
    
    private func setupConstraints() {
        infoStackView.addArrangedSubview(infoImageView)
        infoStackView.addArrangedSubview(infoTitleLabel)
        infoStackView.addArrangedSubview(infoSubtitleLabel)
        infoStackView.addArrangedSubview(tryAgainButton)

        infoView.addSubview(infoStackView)
        view.addSubview(infoView)

        infoView.snp.makeConstraints { make in
            make.height.equalTo(view)
            make.width.equalTo(view)
            make.centerWithinMargins.equalTo(view)
        }

        infoImageView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }

        infoStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(infoView).offset(24)
        }
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
    
    @objc func refresh() {
        presenter.getContactsList(shouldReset: true)
    }
}

extension ContactsListController: ContactsListView {
    func onShowContacts(items: [UIContactItem]) {
        dataSource.updateData(newItems: items)
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func onShowEmptyList() {
        infoView.isHidden = false
    }
    
    func onStartLoading() {
        infoView.isHidden = true
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
