//
//  BasketSingleton.swift
//  GBShop
//
//  Created by Константин Каменчуков on 21.04.2022.
//

import Foundation
import Alamofire

 class BasketSingleton {
   static var shared: BasketSingleton = {
     let instance = BasketSingleton()

     return instance
   }()

   private var products: [Product] = []
   private init() {}

   func addProduct(product: Product) {
     products.append(product)
   }

   func deleteProduct(product: Product) {
     let index = products.firstIndex { $0.id == product.id }
     guard let index = index else { return }

     products.remove(at: index)
   }

   func getProductIds() -> [Int]? {
     guard !products.isEmpty else { return nil }

     return products.map({$0.id})
   }

   func getPrice() -> Double? {
     guard !products.isEmpty else { return nil }

       var cash: Double = 0.0
       products.forEach { cash = cash + $0.price}
       return cash
   }

   func defaultState() {
     products.removeAll()
   }
 }
