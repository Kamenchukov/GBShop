//
//  GetGoodByIdResult.swift
//  GBShop
//
//  Created by Константин Каменчуков on 16.03.2022.
//

import Foundation

struct GetGoodByIdResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
}
