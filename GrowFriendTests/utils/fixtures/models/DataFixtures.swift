//
//  DataFixtures.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

@testable import GrowFriend

class DataFixtures {
    class ContactListResponseUtils {
        static func create() -> ContactListResponse {
            ContactListResponse(contacts: [
                ContactResponseUtils.createMale(),
                ContactResponseUtils.createFemale()
            ])
        }
    }
    
    class ContactResponseUtils {
        static func createFemale() -> ContactResponse {
            ContactResponse(gender: FixturesConstants.ContactFemale.gender,
                          name: NameResponseUtils.createFemale(),
                          email: FixturesConstants.ContactFemale.email,
                          phone: FixturesConstants.ContactFemale.phone,
                          picture: PictureResponseUtils.createFemale())
        }
        
        static func createMale() -> ContactResponse {
            ContactResponse(gender: FixturesConstants.ContactMale.gender,
                          name: NameResponseUtils.createMale(),
                          email: FixturesConstants.ContactMale.email,
                          phone: FixturesConstants.ContactMale.phone,
                          picture: PictureResponseUtils.createMale())
        }
    }
    
    class NameResponseUtils {
        static func createFemale() -> NameResponse {
            NameResponse(first: FixturesConstants.ContactFemale.firstName,
                       last: FixturesConstants.ContactFemale.lastName)
        }
        
        static func createMale() -> NameResponse {
            NameResponse(first: FixturesConstants.ContactMale.firstName,
                       last: FixturesConstants.ContactMale.lastName)
        }
    }
    class PictureResponseUtils {
        static func createFemale() -> PictureResponse {
            PictureResponse(large: FixturesConstants.ContactFemale.large,
                          medium: FixturesConstants.ContactFemale.medium,
                          thumbnail: FixturesConstants.ContactFemale.thumbnail)
        }
        
        static func createMale() -> PictureResponse {
            PictureResponse(large: FixturesConstants.ContactMale.large,
                          medium: FixturesConstants.ContactMale.medium,
                          thumbnail: FixturesConstants.ContactMale.thumbnail)
        }
    }
}
