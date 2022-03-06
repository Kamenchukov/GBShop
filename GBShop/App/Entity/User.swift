//
//  User.swift
//  GBShop
//
//  Created by Константин Каменчуков on 01.03.2022.
//

import Foundation
import SwiftUI

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    let userMassage: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
        case userMassage = "userMassage"
    }
}
