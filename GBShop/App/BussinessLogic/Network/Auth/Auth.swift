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

extension Auth: AuthRequestFactory {
    func catalogData(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[CatalogResult]>) -> Void) {
        let requestModel = catalogDataOfGoods(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getGoodById(productId: Int, completionHandler: @escaping (AFDataResponse<GetGoodByIdResult>) -> Void) {
        let requestModel = getGoodByIdIt(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func changingData(userId: Int, userName: String, password: String, email: String, gender: String, credirCart: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
        
        let requestModel = changeUserData(baseUrl: baseUrl, userId: userId, userName: userName, password: password, email: email, gender: gender, creditCard: credirCart, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func registrationUser(username: String, password: String, email: String, gender: String, credirCart: String, bio: String, completionHandler: @escaping (AFDataResponse<RegisterUserResult>) -> Void) {
        let requestModel = registerUser(baseUrl: baseUrl, username: username, password: password, email: email, gender: gender, creditCard: credirCart, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "login"
        
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "login": login,
                "password": password
            ]
        }
    }
    
    struct Logout: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "logout"
        let userId: Int
        
        var parameters: Parameters? {
            return [
                "userId": userId]
        }
    }
    
    struct registerUser: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "register"
        
        var username: String
        var password: String
        var email: String
        var gender: String
        var creditCard: String
        var bio: String
        
        var parameters: Parameters? {
            return [
                "username": username,
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
        var method: HTTPMethod = .post
        var path: String = "changeUserData"
        
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
        var method: HTTPMethod = .post
        var path: String = "getGoodById"
        
        var productId: Int
        var parameters: Parameters? {
            return [
            "productId": productId
            ]
        }
    }
    
    struct catalogDataOfGoods: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "catalog"
        
        var pageNumber: Int
        var categoryId: Int
        var parameters: Parameters? {
            return [
                "pageNumber": pageNumber,
                "categoryId": categoryId
            ]
        }
        
        
    }
}

