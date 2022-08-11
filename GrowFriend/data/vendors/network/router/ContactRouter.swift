//
//  ContactRouter.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Moya

enum ContactRouter: Routable {
    case getContacts(num: Int)
    
    var method: Moya.Method {
        switch self {
        case .getContacts: return .get
        }
    }
    
    var path: String { "/api/" }
    
    var task: Task {
        switch self {
        case .getContacts(let num): return .requestParameters(parameters: ["results": "\(num)"], encoding: URLEncoding.default)
        }
    }
}
