//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Константин Каменчуков on 01.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
    
    func registrationUser(username: String, password: String, email: String, gender: String, credirCart: String, bio:String, completionHandler: @escaping (AFDataResponse<RegisterUserResult>) -> Void)
    
    func changingData(userId: Int, userName: String, password: String, email: String, gender: String, credirCart: String, bio:String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
    
    func getGoodById(productId: Int, completionHandler: @escaping (AFDataResponse<GetGoodByIdResult>) -> Void)
    
    func catalogData(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[CatalogResult]>) -> Void)
}
