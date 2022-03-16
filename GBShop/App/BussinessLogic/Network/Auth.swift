//
//  Auth.swift
//  GBShop
//
//  Created by Константин Каменчуков on 01.03.2022.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Auth: AuthRequestFactory {
    func catalogData(page_number: Int, id_category: Int, completionHandler: @escaping (AFDataResponse<[CatalogResult]>) -> Void) {
        let requestModel = catalogDataOfGoods(baseUrl: baseUrl, page_number: page_number, id_category: id_category)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getGoodById(id_product: Int, completionHandler: @escaping (AFDataResponse<GetGoodByIdResult>) -> Void) {
        let requestModel = getGoodByIdIt(baseUrl: baseUrl, id_product: id_product)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func changingData(userId: Int, userName: String, password: String, email: String, gender: String, credirCart: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
        
        let requestModel = changeUserData(baseUrl: baseUrl, userId: userId, userName: userName, password: password, email: email, gender: gender, creditCard: credirCart, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func registrationUser(userId: Int, userName: String, password: String, email: String, gender: String, credirCart: String, bio: String, completionHandler: @escaping (AFDataResponse<RegisterUserResult>) -> Void) {
        let requestModel = registerUser(baseUrl: baseUrl, userId: userId, userName: userName, password: password, email: email, gender: gender, creditCard: credirCart, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
//        let requestModel = Login(baseUrl: baseUrl, userName: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
    
    struct Logout: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "logout.json"
        let id: Int
        
        var parameters: Parameters? {
            return [
                "id_user": id]
        }
    }
    
    struct registerUser: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "registerUser.json"
        
        var userId: Int
        var userName: String
        var password: String
        var email: String
        var gender: String
        var creditCard: String
        var bio: String
        
        var parameters: Parameters? {
            return [
                "userId": userId,
                "userName": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "creditCard": creditCard,
                "bio": bio
            ]
        }
    }
    struct changeUserData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "changeUserData.json"
        
        var userId: Int
        var userName: String
        var password: String
        var email: String
        var gender: String
        var creditCard: String
        var bio: String
        
        var parameters: Parameters? {
            return [
                "userId": userId,
                "userName": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "creditCard": creditCard,
                "bio": bio
            ]
        }
    }
    
    struct getGoodByIdIt: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getGoodById.json"
        
        var id_product: Int
        var parameters: Parameters? {
            return [
            "id_product": id_product
            ]
        }
    }
    
    struct catalogDataOfGoods: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "catalogData.json"
        
        var page_number: Int
        var id_category: Int
        var parameters: Parameters? {
            return [
                "page_number": page_number,
                "id_category": id_category
            ]
        }
        
        
    }
}

