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

    private var errorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.isHidden = true
        return view
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Check your connection 😥"
        return label
    }()

    private var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 244/255, alpha: 1)
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

        title = "Contacts List"
        navigationController?.navigationBar.backgroundColor = .darkGray
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        view.backgroundColor = .darkGray
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
            make.centerX.equalTo(view)
            make.top.equalTo(view)
            make.left.equalTo(view)
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
        
        view.addSubview(errorView)

        errorView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
        }
        
        errorView.addSubview(errorLabel)
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(errorView)
            make.left.equalTo(errorView)
            make.right.equalTo(errorView)
            make.bottom.equalTo(errorView)
        }
    }
    
    private func setupTableView() {
        dataSource.delegate = self

        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.prefetchDataSource = dataSource
        
        tableView.separatorStyle = .none
        tableView.registerReusableCell(ContactCardCell.self)
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: [.foregroundColor: UIColor.white])
        refreshControl?.tintColor = .white
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
        
        if !errorView.isHidden {
            errorView.isHidden = true
        }
    }
    
    func onShowEmptyList() {
        if infoView.isHidden {
            infoView.isHidden = false
            tableView.isScrollEnabled = false
            errorView.isHidden = true
        }
    }
    
    func onStartLoading() {
        if !infoView.isHidden {
            infoView.isHidden = true
            tableView.isScrollEnabled = true
        }
    }

    func onStopLoading() {
        if refreshControl?.isRefreshing ?? false {
            refreshControl?.endRefreshing()
        }
    }
    
    func onReceiveNetworkError(_ error: UIErrorItem) {
        if errorView.isHidden {
            errorView.isHidden = false
        }
    }
}

extension ContactsListController: ContactsListDelegate {
    func fetchNewContacts() {
        presenter.getContactsList(shouldReset: false)
    }
    
    func didSelectItem(item: UIContactItem) {
        let vc = ContactDetailsController()
        vc.item = item
        navigationController?.pushViewController(vc, animated: true)
    }
}
