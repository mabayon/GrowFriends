//
//  RxBlockingExtensions.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation
import RxBlocking
import RxSwift
import XCTest

extension ObservableConvertibleType {
    func test() -> BlockingObservable<Self.Element> {
        toBlocking()
    }
}

extension BlockingObservable where Element: Equatable {
    func assertValue(value: Element) {
        switch materialize() {
            case let .completed(elements):
                guard elements.count == 1 else {
                    XCTFail("\(elements.count) values found instead of 1")
                    return
                }

                XCTAssertEqual(elements.first!, value)
            case let .failed(_, unwrappedError):
                XCTFail("Expected \(value) but threw error : \(unwrappedError)")
        }
    }
}
