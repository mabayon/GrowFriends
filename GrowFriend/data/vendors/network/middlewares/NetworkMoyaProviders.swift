//
//  NetworkMoyaProviders.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Alamofire
import Foundation
import Moya
import RxSwift

/**
 Http moya client used for protected api request
 */
/**
 Http moya client used for unprotected api request
 */
class UnprotectedMoyaProvider<T: TargetType>: MoyaProvider<T> {
    init(session: UnprotectedSession, queue: DispatchQueue? = nil, endPointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping, stubClosure: @escaping StubClosure = MoyaProvider.neverStub) {
        super.init(endpointClosure: endPointClosure, stubClosure: stubClosure, callbackQueue: queue, session: session)
    }

    func createSingle<T: Decodable>(route: Target, typeOf _: T.Type) -> Single<T> {
        getSingle(route: route)
    }
}

extension MoyaProviderType {
    func getSingle<T: Decodable>(route: Target) -> Single<T> {
        Single<T>.create { [weak self] single in
            let request = self?.request(route, callbackQueue: nil, progress: nil) { result in
                switch result {
                    case let .success(moyaResponse):
                        do {
                            let object = try moyaResponse.map(T.self, failsOnEmptyData: true)
                            single(.success(object))
                        } catch {
                            print("Response body is malformatted (cf spec): \(error.localizedDescription)")
                            single(.failure(error))
                        }
                    case let .failure(error):
                    print(error.localizedDescription)
                    single(.failure(error))
                }
            }
            return Disposables.create { request?.cancel() }
        }
    }
}
