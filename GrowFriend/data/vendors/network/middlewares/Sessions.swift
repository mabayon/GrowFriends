//
//  Sessions.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Alamofire
import Foundation
import Moya

/**
 * Alamofire unprotected session used for moya. Should be use only for API who don't need an authenticated user for using apis
 */
class UnprotectedSession: Session {
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        configuration.timeoutIntervalForRequest = 10 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 10 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        self.init(configuration: configuration)
    }
}
