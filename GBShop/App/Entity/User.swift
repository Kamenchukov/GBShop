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
}
