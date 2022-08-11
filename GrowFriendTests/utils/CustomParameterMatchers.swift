//
//  CustomParameterMatchers.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Cuckoo
import Foundation

@testable import GrowFriend

func equal<T: Routable>(to value: Routable) -> ParameterMatcher<T> {
    ParameterMatcher { (actual: Routable) in
        actual.method == value.method &&
            actual.task.isEqual(to: value.task) &&
            actual.path == value.path &&
            actual.headers == value.headers
    }
}
