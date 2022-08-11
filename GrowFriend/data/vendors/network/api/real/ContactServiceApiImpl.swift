//
//  ContactsServiceApiImpl.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import RxSwift

class ContactServiceApiImpl: ContactServiceApi {
    private let provider: UnprotectedMoyaProvider<ContactRouter>
    
    init(provider: UnprotectedMoyaProvider<ContactRouter>) {
        self.provider = provider
    }

    func getContacts(num: Int) -> Single<ContactListResponse> {
        provider.createSingle(route: ContactRouter.getContacts(num: num), typeOf: ContactListResponse.self)
    }
}
