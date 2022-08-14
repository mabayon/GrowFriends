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
                          picture: UIPictureItemUtils.createFemale(),
                          location: UILocationItemUtils.createFemale())
        }
        
        static func createMale() -> UIContactItem {
            UIContactItem(gender: .male,
                          name: UINameItemUtils.createMale(),
                          email: FixturesConstants.ContactMale.email,
                          phone: FixturesConstants.ContactMale.phone,
                          picture: UIPictureItemUtils.createMale(),
                          location: UILocationItemUtils.createMale())
        }
    }
    
    class UICoordinatesItemUtils {
        static func createFemale() -> UICoordinatesItem {
            UICoordinatesItem(latitude: "\(FixturesConstants.ContactFemale.latitude)", longitude: "\(FixturesConstants.ContactFemale.longitude)")
        }
        
        static func createMale() -> UICoordinatesItem {
            UICoordinatesItem(latitude: "\(FixturesConstants.ContactMale.latitude)", longitude: "\(FixturesConstants.ContactMale.longitude)")
        }
    }
 
    
    class UIErrorItemUtils {
        static func create() -> UIErrorItem {
            UIErrorItem(errorMessage: FixturesConstants.errorMessage)
        }
    }
    
    class UILocationItemUtils {
        static func createFemale() -> UILocationItem {
            UILocationItem(street: UIStreetItemUtils.createFemale(),
                             city: FixturesConstants.ContactFemale.city,
                             country: FixturesConstants.ContactMale.country,
                             coordinates: UICoordinatesItemUtils.createFemale())
        }
        
        static func createMale() -> UILocationItem {
            UILocationItem(street: UIStreetItemUtils.createMale(),
                             city: FixturesConstants.ContactMale.city,
                             country: FixturesConstants.ContactMale.country,
                             coordinates: UICoordinatesItemUtils.createMale())
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
    
    class UIStreetItemUtils {
        static func createFemale() -> UIStreetItem {
            UIStreetItem(number: FixturesConstants.ContactFemale.streetNumber, name: FixturesConstants.ContactFemale.streetName)
        }
        
        static func createMale() -> UIStreetItem {
            UIStreetItem(number: FixturesConstants.ContactMale.streetNumber, name: FixturesConstants.ContactMale.streetName)
        }
    }
}
