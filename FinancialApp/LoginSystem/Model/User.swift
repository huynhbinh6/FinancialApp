//
//  User.swift
//  FinancialApp
//
//  Created by Huỳnh Bình on 25/7/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
