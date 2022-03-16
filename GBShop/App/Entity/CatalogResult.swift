//
//  CatalogResult.swift
//  GBShop
//
//  Created by Константин Каменчуков on 16.03.2022.
//

import Foundation
import SwiftUI

struct CatalogResult: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}

