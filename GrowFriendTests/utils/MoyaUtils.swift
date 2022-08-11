//
//  MoyaUtils.swift
//  GrowFriendTests
//
//  Created by Mathieu Bayon on 11/08/2022.
//

import Foundation
import Moya

@testable import GrowFriend

extension Task: Equatable {
    public static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.isEqual(to: rhs)
    }

    public func isEqual(to newTask: Task) -> Bool {
        if case .requestJSONEncodable = self, case .requestJSONEncodable = newTask { return true }
        if case let .requestData(data1) = self, case let .requestData(data2) = newTask {
            if data1 == data2 {
                return true
            } else { return false }
        }
        if case .requestPlain = self, case .requestPlain = newTask { return true }
        if case .requestParameters = self, case .requestParameters = newTask {
            return true
        }
        if case let .uploadMultipart(data1) = self, case let .uploadMultipart(data2) = newTask {
            if data1.first?.fileName == data2.first?.fileName, data1.first?.name == data2.first?.name, data1.first?.mimeType == data2.first?.mimeType {
                if case let .data(toto1) = data1.first?.provider, case let .data(toto2) = data2.first?.provider {
                    return toto1 == toto2
                }
            }
            return false
        }

        fatalError("The task you are trying to compare is not handled, update the case above to add yours !")
    }
}
