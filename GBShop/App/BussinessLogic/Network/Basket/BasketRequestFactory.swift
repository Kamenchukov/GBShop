//
//  BasketRequestFactory.swift
//  GBShop
//
//  Created by Константин Каменчуков on 21.04.2022.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    
    func payBasket(userId: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void)
}
