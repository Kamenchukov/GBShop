//
//  CatalogResult.swift
//  GBShop
//
//  Created by Константин Каменчуков on 16.03.2022.
//

import Foundation
import SwiftUI

struct CatalogResult: Codable {
    var result: Int
    let productId: Int
    let productName: String
    let price: Int
}

