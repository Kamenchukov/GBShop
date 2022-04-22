//
//  Basket.swift
//  GBShop
//
//  Created by Константин Каменчуков on 21.04.2022.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl = URL(string: "https://fast-falls-02659.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Basket: BasketRequestFactory {
    func payBasket(userId: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
            let requestModel = BasketAction(baseUrl: baseUrl, userId: userId)
            self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension Basket {
    struct BasketAction: RequestRouter {
         let baseUrl: URL
         let method: HTTPMethod = .post
         let path = "payProduct"
         let userId: Int
         let products = BasketSingleton.shared.getProductIds() ?? []
         let cash = BasketSingleton.shared.getPrice() ?? 0
         let encoding: RequestRouterEncoding = .json

         var parameters: Parameters? {
           return [
             "userId" : userId,
             "productsId" : products,
             "cash" : cash
           ]
         }
       }
}
