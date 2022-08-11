//
//  ContactsServiceApi.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import RxSwift

protocol ContactServiceApi {
    func getContacts(num: Int) -> Single<ContactListResponse>
}
