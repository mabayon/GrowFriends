//
//  FixturesConstants.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

class FixturesConstants {
    static let errorCode = 500
    static let errorMessage = "Something went wrong"

    class ContactFemale {
        static let firstName = "Kayla"
        static let lastName = "Jennings"
        static let gender = "female"
        static let email = "kayla.jennings@example.com"
        static let phone = "041-910-3807"
        static let large = "https://randomuser.me/api/portraits/women/81.jpg"
        static let medium = "https://randomuser.me/api/portraits/med/women/81.jpg"
        static let thumbnail = "https://randomuser.me/api/portraits/thumb/women/81.jpg"
        static let streetNumber = 43
        static let streetName = "Fairview Road"
        static let city = "Sunderland"
        static let country = "United Kingdom"
        static let latitude = "28.5915"
        static let longitude = "37.4769"
    }

    class ContactMale {
        static let firstName = "Édipo"
        static let lastName = "Caldeira"
        static let gender = "male"
        static let email = "edipo.caldeira@example.com"
        static let phone = "(94) 1531-3035"
        static let large = "https://randomuser.me/api/portraits/men/7.jpg"
        static let medium = "https://randomuser.me/api/portraits/med/men/7.jpg"
        static let thumbnail = "https://randomuser.me/api/portraits/thumb/men/7.jpg"
        static let streetNumber = 1547
        static let streetName = "Stanley Way"
        static let city = "Aylmer"
        static let country = "Canada"
        static let latitude = -57.6511
        static let longitude = 14.9676
    }
}
