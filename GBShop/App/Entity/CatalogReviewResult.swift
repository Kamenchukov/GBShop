//
//  CatalogReviewResult.swift
//  GBShop
//
//  Created by Константин Каменчуков on 19.04.2022.
//

import Foundation

struct CatalogReviewResult: Codable {
    let result: Int
    let userId: Int
    let text: String
}
