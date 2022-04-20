//
//  RegisterUserResult.swift
//  GBShop
//
//  Created by Константин Каменчуков on 16.03.2022.
//

import Foundation

struct RegisterUserResult: Codable {
    var userId: String
    let result: Int
    let userMessage: String
}
