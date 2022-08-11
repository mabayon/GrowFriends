//
//  Routable.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import Moya

protocol Routable: TargetType {}

extension Routable {
    var headers: [String: String]? { ["Content-Type": "application/json"] }
    var sampleData: Data { Data() }
    var baseURL: URL { URL(string: "https://randomuser.me")! }
    var validationType: ValidationType { .successAndRedirectCodes }
}
