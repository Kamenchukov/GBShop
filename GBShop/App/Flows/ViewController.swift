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
    }
    
    func authRequest() {
        let auth = requestFactory.makeAuthRequestFatory()
        
        auth.login(userName: "Somebody", password: "mypassword") {
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
        logoutRequest.logout(id: 123) { response in
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
        registerRequest.registrationUser(userId: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", credirCart: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
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
        changeUserDataRequest.changingData(userId: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", credirCart: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
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
        
        getGoodByIdRequest.getGoodById(id_product: 123) { response in
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
        
        catalogDataRequest.catalogData(page_number: 1, id_category: 1) { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

