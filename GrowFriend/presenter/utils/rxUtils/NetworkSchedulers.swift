//
//  SchedulersContext.swift
//  GrowFriend
//
//  Created by Mathieu Bayon on 10/08/2022.
//

import Foundation
import RxSwift

protocol MainSchedulerProvider {
    var main: ImmediateSchedulerType { get }
}

protocol IOSchedulerProvider {
    var io: ImmediateSchedulerType { get }
}

protocol NetworkSchedulers: MainSchedulerProvider, IOSchedulerProvider {}

class NetworkSchedulersImpl: NetworkSchedulers {
    let main: ImmediateSchedulerType = MainScheduler.instance
    let io: ImmediateSchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)
}
