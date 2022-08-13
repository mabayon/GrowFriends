//
//  DomainFixtures.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation

@testable import GrowFriend

class DomainFixtures {
    class DomainContactListUtils {
        static func create() -> DomainContactList {
            DomainContactList(contacts: [
                DomainContactUtils.createMale(),
                DomainContactUtils.createFemale()
            ])
        }
    }
    
    class DomainContactUtils {
        static func createFemale() -> DomainContact {
            DomainContact(gender: DomainGender(rawValue: FixturesConstants.ContactFemale.gender)!,
                          name: DomainNameUtils.createFemale(),
                          email: FixturesConstants.ContactFemale.email,
                          phone: FixturesConstants.ContactFemale.phone,
                          picture: DomainPictureUtils.createFemale())
        }
        
        static func createMale() -> DomainContact {
            DomainContact(gender: DomainGender(rawValue: FixturesConstants.ContactMale.gender)!,
                          name: DomainNameUtils.createMale(),
                          email: FixturesConstants.ContactMale.email,
                          phone: FixturesConstants.ContactMale.phone,
                          picture: DomainPictureUtils.createMale())
        }
    }
    
    class DomainErrorUtils {
        static func createNetworkException() -> DomainNetworkException {
            DomainNetworkException(code: FixturesConstants.errorCode, errorMessage: FixturesConstants.errorMessage)
        }
        
        static func createAPIDecodeException() -> DomainAPIDecodeException {
            DomainAPIDecodeException(errorMessage: FixturesConstants.errorMessage)
        }
    }
    
    class DomainNameUtils {
        static func createFemale() -> DomainName {
            DomainName(first: FixturesConstants.ContactFemale.firstName,
                       last: FixturesConstants.ContactFemale.lastName)
        }
        
        static func createMale() -> DomainName {
            DomainName(first: FixturesConstants.ContactMale.firstName,
                       last: FixturesConstants.ContactMale.lastName)
        }
    }
    class DomainPictureUtils {
        static func createFemale() -> DomainPicture {
            DomainPicture(large: FixturesConstants.ContactFemale.large,
                          medium: FixturesConstants.ContactFemale.medium,
                          thumbnail: FixturesConstants.ContactFemale.thumbnail)
        }
        
        static func createMale() -> DomainPicture {
            DomainPicture(large: FixturesConstants.ContactMale.large,
                          medium: FixturesConstants.ContactMale.medium,
                          thumbnail: FixturesConstants.ContactMale.thumbnail)
        }
    }
}
