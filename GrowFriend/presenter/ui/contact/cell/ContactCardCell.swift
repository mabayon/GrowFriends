//
//  ContactCardCell.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import SnapKit
import UIKit

class ContactCardCell: UITableViewCell, Reusable {
    private var profileImageView = UIImageView()
    private var genderImageView = UIImageView()

    private var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.style = .large
        indicatorView.color = .black
        return indicatorView
    }()

    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private var firstNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private var lastNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()

    private var email: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private var phone: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    private var infosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 244/255, alpha: 1)
        containerView.applyShadow()
        containerView.applyRounded()
    }
    
    private func setupConstraints() {
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.left.equalTo(contentView).offset(8)
            make.right.equalTo(contentView).offset(-8)
            make.bottom.equalTo(contentView).offset(-8)
        }

        contentView.addSubview(indicatorView)
        
        indicatorView.snp.makeConstraints { make in
            make.centerWithinMargins.equalTo(contentView)
        }

        containerView.addSubview(profileImageView)

        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(24)
            make.left.equalTo(containerView).offset(16)
            make.height.equalTo(75)
            make.width.equalTo(75)
        }
        
        nameStackView.addArrangedSubview(firstNameLabel)
        nameStackView.addArrangedSubview(lastNameLabel)

        infosStackView.addArrangedSubview(nameStackView)
        infosStackView.addArrangedSubview(email)
        infosStackView.addArrangedSubview(phone)
        containerView.addSubview(infosStackView)
        
        infosStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(24)
            make.left.equalTo(profileImageView.snp_rightMargin).offset(16)
            make.bottom.equalTo(contentView).offset(-24)
        }
        
        containerView.addSubview(genderImageView)
        
        genderImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(24)
            make.left.greaterThanOrEqualTo(infosStackView.snp_rightMargin).offset(16)
            make.right.equalTo(contentView).offset(-24)
            make.height.equalTo(32)
            make.width.equalTo(32)
        }
    }
    
    func onBind(item: UIContactItem?) {
        if item == .none {
            indicatorView.startAnimating()
            containerView.subviews.forEach { $0.isHidden = true }
        } else {
            indicatorView.stopAnimating()
            containerView.subviews.forEach { $0.isHidden = false }
        }
        profileImageView.loadImage(from: item?.picture.large)
        firstNameLabel.text = item?.name.first
        lastNameLabel.text = item?.name.last.uppercased()
        email.text = item?.email
        phone.text = item?.phone
        genderImageView.image = item?.gender.getImage()
    }
}
