//
//  CommandsRequestFactory.swift
//  GBShop
//
//  Created by Константин Каменчуков on 19.04.2022.
//

import Foundation
import Alamofire

protocol CommandsRequestFactory {
    func addReview(userId: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
    
    func removeReview(commentId: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
    
    func catalogReview(pageNumber: Int, completionHandler: @escaping (AFDataResponse<[CatalogReviewResult]>) -> Void)
}
