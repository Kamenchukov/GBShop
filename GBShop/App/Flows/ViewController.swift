//
//  ViewController.swift
//  GBShop
//
//  Created by Константин Каменчуков on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    let requestFactory = RequestFactory()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authRequest()
        logoutRequest()
        registerUser()
        changeUserData()
        getGoodById()
        catalogData()
        addReview()
        removeReview()
        catalogReview()
//        payBasketFlow()
    }
    
    func authRequest() {
        let auth = requestFactory.makeAuthRequestFatory()
        
        auth.login(userName: "konstantin", password: "pas$w0rd") {
            response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func logoutRequest() {
        let logoutRequest = requestFactory.makeAuthRequestFatory()
        logoutRequest.logout(userId: 123) { response in
            switch response.result {
            case .success(let result):
                    print(result)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    func registerUser() {
        let registerRequest = requestFactory.makeAuthRequestFatory()
        registerRequest.registrationUser(username: "Konstantin", password: "pas$w0rd", email: "konstantin@kamenchukov.ru", gender: "male", credirCart: "1234123412341234", bio: "the best") { response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func changeUserData() {
        let changeUserDataRequest = requestFactory.makeAuthRequestFatory()
        changeUserDataRequest.changingData(userId: 123, userName: "Konstantin", password: "pas$w0rd", email: "konstantin@kamenchukov.ru", gender: "male", credirCart: "1234123412341234", bio: "Customer") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func getGoodById() {
        let getGoodByIdRequest = requestFactory.makeAuthRequestFatory()
        
        getGoodByIdRequest.getGoodById(productId: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func catalogData() {
        let catalogDataRequest = requestFactory.makeAuthRequestFatory()
        
        catalogDataRequest.catalogData(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addReview() {
        let addReviewRequest = requestFactory.makeCommandsRequestFactory()
        
        addReviewRequest.addReview(userId: 123, text: "Техника мощь") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func removeReview() {
        let removeReviewRequest = requestFactory.makeCommandsRequestFactory()
        
        removeReviewRequest.removeReview(commentId: 123) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func catalogReview() {
        let catalogReviewRequest = requestFactory.makeCommandsRequestFactory()
        
        catalogReviewRequest.catalogReview(pageNumber: 1) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func payBasketFlow() {
        let basket = BasketSingleton.shared
        let basketRequest = requestFactory.makeBasketRequestFactory()

         basket.addProduct(product: Product(
           id: 1,
           name: "Ipad",
           price: 70000,
           description: "Планшет"
         ))
         basket.addProduct(product: Product(
           id: 2,
           name: "MacBook Pro",
           price: 250000,
           description: "ноутбук"
         ))
        basketRequest.payBasket(userId: Int(UUID().uuidString)!) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
       }
    
}

