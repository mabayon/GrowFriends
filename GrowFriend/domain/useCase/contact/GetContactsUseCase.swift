//
//  GetContactsUseCase.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import RxSwift

class GetContactsUseCase {
    private let contactRepository: ContactRepository
    
    init(contactRepository: ContactRepository) {
        self.contactRepository = contactRepository
    }
    
    func invoke(num: Int = 10) -> Single<DomainContactList> {
        contactRepository.getContacts(num: num)
    }
}
