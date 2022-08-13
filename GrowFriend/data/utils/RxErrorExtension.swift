//
//  RxErrorExtension.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 13/08/2022.
//

import Foundation
import RxSwift

extension Single {
    func throwDomainExceptionOnError() -> PrimitiveSequence<Trait, Element> {
        self.catch { error in throw (error as? DataError)?.toDomain() ?? NSError() }
    }
}

extension Observable {
    func throwDomainExceptionOnError() -> Observable<Element> {
        self.catch { error -> Observable<Element> in
            throw (error  as? DataError)?.toDomain() ?? NSError()
        }
    }
}
