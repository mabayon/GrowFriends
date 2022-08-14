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
                          picture: PictureResponseUtils.createFemale(),
                            location: LocationResponseUtils.createFemale())
        }
        
        static func createMale() -> ContactResponse {
            ContactResponse(gender: FixturesConstants.ContactMale.gender,
                          name: NameResponseUtils.createMale(),
                          email: FixturesConstants.ContactMale.email,
                          phone: FixturesConstants.ContactMale.phone,
                          picture: PictureResponseUtils.createMale(),
                            location: LocationResponseUtils.createMale())
        }
    }
    
    class CoordinatesResponseUtils {
        static func createFemale() -> CoordinatesResponse {
            CoordinatesResponse(latitude: "\(FixturesConstants.ContactFemale.latitude)", longitude: "\(FixturesConstants.ContactFemale.longitude)")
        }
        
        static func createMale() -> CoordinatesResponse {
            CoordinatesResponse(latitude: "\(FixturesConstants.ContactMale.latitude)", longitude: "\(FixturesConstants.ContactMale.longitude)")
        }
    }

    class DataErrorUtils {
        static func createNetworkException() -> DataNetworkException {
            DataNetworkException(code: FixturesConstants.errorCode, errorMessage: FixturesConstants.errorMessage)
        }
        
        static func createAPIDecodeException() -> DataAPIDecodeException {
            DataAPIDecodeException(errorMessage: FixturesConstants.errorMessage)
        }
    }
    
    class LocationResponseUtils {
        static func createFemale() -> LocationResponse {
            LocationResponse(street: StreetResponseUtils.createFemale(),
                             city: FixturesConstants.ContactFemale.city,
                             country: FixturesConstants.ContactMale.country,
                             coordinates: CoordinatesResponseUtils.createFemale())
        }
        
        static func createMale() -> LocationResponse {
            LocationResponse(street: StreetResponseUtils.createMale(),
                             city: FixturesConstants.ContactMale.city,
                             country: FixturesConstants.ContactMale.country,
                             coordinates: CoordinatesResponseUtils.createMale())
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
    
    class StreetResponseUtils {
        static func createFemale() -> StreetResponse {
            StreetResponse(number: FixturesConstants.ContactFemale.streetNumber, name: FixturesConstants.ContactFemale.streetName)
        }
        
        static func createMale() -> StreetResponse {
            StreetResponse(number: FixturesConstants.ContactMale.streetNumber, name: FixturesConstants.ContactMale.streetName)
        }
    }
}
