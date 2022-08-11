//
//  TestNetworkSchedulers.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import RxSwift

@testable import GrowFriend

class TestNetworkSchedulers: NetworkSchedulers {
    let main: ImmediateSchedulerType = CurrentThreadScheduler.instance
    let io: ImmediateSchedulerType = CurrentThreadScheduler.instance
}
