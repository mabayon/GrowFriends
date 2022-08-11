//
//  PresenterFixtures.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

@testable import GrowFriend

class PresenterFixtures {
    class UIContactListItemUtils {
        static func create() -> UIContactListItem {
            UIContactListItem(contacts: [
                UIContactItemUtils.createMale(),
                UIContactItemUtils.createFemale()
            ])
        }
    }
    
    class UIContactItemUtils {
        static func createFemale() -> UIContactItem {
            UIContactItem(gender: .female,
                          name: UINameItemUtils.createFemale(),
                          email: FixturesConstants.ContactFemale.email,
                          phone: FixturesConstants.ContactFemale.phone,
                          picture: UIPictureItemUtils.createFemale())
        }
        
        static func createMale() -> UIContactItem {
            UIContactItem(gender: .male,
                          name: UINameItemUtils.createMale(),
                          email: FixturesConstants.ContactMale.email,
                          phone: FixturesConstants.ContactMale.phone,
                          picture: UIPictureItemUtils.createMale())
        }
    }
    
    class UINameItemUtils {
        static func createFemale() -> UINameItem {
            UINameItem(first: FixturesConstants.ContactFemale.firstName,
                       last: FixturesConstants.ContactFemale.lastName)
        }
        
        static func createMale() -> UINameItem {
            UINameItem(first: FixturesConstants.ContactMale.firstName,
                       last: FixturesConstants.ContactMale.lastName)
        }
    }

    class UIPictureItemUtils {
        static func createFemale() -> UIPictureItem {
            UIPictureItem(large: FixturesConstants.ContactFemale.large,
                          medium: FixturesConstants.ContactFemale.medium,
                          thumbnail: FixturesConstants.ContactFemale.thumbnail)
        }
        
        static func createMale() -> UIPictureItem {
            UIPictureItem(large: FixturesConstants.ContactMale.large,
                          medium: FixturesConstants.ContactMale.medium,
                          thumbnail: FixturesConstants.ContactMale.thumbnail)
        }
    }
}
