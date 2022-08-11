//
//  ContactRepositoryImpl.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import RxSwift

class ContactRepositoryImpl: ContactRepository {
    private let contactServiceApi: ContactServiceApi
    
    init(contactServiceApi: ContactServiceApi) {
        self.contactServiceApi = contactServiceApi
    }
    
    func getContacts(num: Int) -> Single<DomainContactList> {
        contactServiceApi.getContacts(num: num)
            .map { $0.toDomain() }
    }
}
