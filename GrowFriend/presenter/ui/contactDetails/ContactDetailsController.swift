//
//  ContactDetailsController.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 14/08/2022.
//

import MapKit
import SnapKit
import UIKit

class ContactDetailsController: UIViewController {
    @Inject private var presenter: ContactDetailsPresenter

    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 244/255, alpha: 1)
        return view
    }()
    
    private var contactInfoView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.applyRounded()
        view.applyShadow()
        return view
    }()

    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "no_photo")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 75 / 2
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var infosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
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
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    
    private var buttonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
    }()

    private var phoneButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "phone"), for: .normal)
        return button
    }()
    
    private var emailButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "email"), for: .normal)
        return button
    }()
    
    private var mapView: MKMapView = {
       let mapView = MKMapView()
        return mapView
    }()
        
    var item: UIContactItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item = item else {
            navigationController?.popViewController(animated: true)
            return
        }

        view.backgroundColor = .darkGray
        phoneButton.addTarget(self, action: #selector(didTapPhoneButton), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(didTapEmailButton), for: .touchUpInside)
        
        setupConstraints()
        
        presenter.attach(self)
        presenter.setup(item: item)
    }
    
    @objc private func didTapPhoneButton() {
        presenter.didTapCall()
    }
    
    @objc private func didTapEmailButton() {
        presenter.didTapEmail()
    }
    
    private func setupConstraints() {
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.addSubview(contactInfoView)
        
        contactInfoView.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(50)
            make.left.equalTo(containerView).offset(16)
            make.right.equalTo(containerView).offset(-16)
        }
        
        contactInfoView.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contactInfoView.snp.top)
            make.centerX.equalTo(contactInfoView.snp.centerX)
            make.height.equalTo(75)
            make.width.equalTo(75)
        }
        
        nameStackView.addArrangedSubview(firstNameLabel)
        nameStackView.addArrangedSubview(lastNameLabel)

        buttonsStack.addArrangedSubview(phoneButton)
        buttonsStack.addArrangedSubview(emailButton)

        phoneButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(50)
        }

        infosStackView.addArrangedSubview(nameStackView)
        infosStackView.addArrangedSubview(email)
        infosStackView.addArrangedSubview(buttonsStack)
        contactInfoView.addSubview(infosStackView)

        infosStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.centerX.equalTo(contactInfoView)
            make.bottom.equalTo(contactInfoView).offset(-16)
        }
        
        containerView.addSubview(mapView)
        
        mapView.snp.makeConstraints { make in
            make.top.equalTo(infosStackView.snp.bottom).offset(40)
            make.left.equalTo(containerView)
            make.right.equalTo(containerView)
            make.bottom.equalTo(containerView)
        }
    }
    
    private func setAnnotation(title: String, coordinate: CLLocationCoordinate2D) -> MKAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = coordinate
        return annotation
    }
}

extension ContactDetailsController: ContactDetailsView {
    func onBind(item: UIContactItem) {
        profileImageView.loadImage(from: item.picture.large)
        firstNameLabel.text = item.name.first
        lastNameLabel.text = item.name.last.uppercased()
        email.text = item.email
        
        if let latitude = Double(item.location.coordinates.latitude),
           let longitude = Double(item.location.coordinates.longitude) {
            let annotation = setAnnotation(title: item.location.getFormattedAddress(),
                                           coordinate: CLLocationCoordinate2D(latitude: latitude,
                                                                              longitude: longitude))
            mapView.addAnnotations([annotation])
            mapView.setCenter(CLLocationCoordinate2D(latitude: latitude,
                                                     longitude: longitude),
                              animated: false)
        }
    }

    func onShowCallApp(phoneNumber: String) {
        if let url = URL(string: "tel://" + phoneNumber) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            showAlert(title: "Warning", message: "You cannot call this number 😥", actionTitle: "OK")
        }
    }
    
    func onShowEmailApp(email: String) {
        if let url = URL(string: "mailto://" + email) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            showAlert(title: "Warning", message: "You cannot send an email 😥", actionTitle: "OK")
        }
    }
    
    private func showAlert(title: String, message: String, actionTitle: String) {
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: actionTitle, style: .default)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
}
