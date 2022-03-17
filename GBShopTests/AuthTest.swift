//
//  AuthTest.swift
//  GBShopTests
//
//  Created by Константин Каменчуков on 16.03.2022.
//

import XCTest
import Alamofire
@testable import GBShop


class AuthTest: XCTestCase {
    let expectation = XCTestExpectation(description: "login.json")
    let expectationLogout = XCTestExpectation(description: "logout.json")
    let expectationRegisterUser = XCTestExpectation(description: "registerUser.json")
    let expectationChangeUserData = XCTestExpectation(description: "changeUserData.json")
    let expectationCatalogData = XCTestExpectation(description: "catalogData.json")
    let expectationGetGoodById = XCTestExpectation(description: "getGoodById.json")
    
    var requestFactory: RequestFactory!

    override func setUpWithError() throws {
        super.setUp()
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        requestFactory = nil
    }
    
    func testLogin() {
        let login = requestFactory.makeAuthRequestFatory()
        
        login.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    func testLogout() {
        let logout = requestFactory.makeAuthRequestFatory()
        
        logout.logout(id: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectationLogout.fulfill()
        }
        wait(for: [expectationLogout], timeout: 5.0)
    }
    
    func testRegisterUser() {
        let registerUser = requestFactory.makeAuthRequestFatory()
        
        registerUser.registrationUser(userId: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", credirCart: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let registration):
                print(registration)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectationRegisterUser.fulfill()
        }
        wait(for: [expectationRegisterUser], timeout: 5.2)
    }
    
    func testChangeUserData() {
        let changeUserData = requestFactory.makeAuthRequestFatory()
        
        changeUserData.changingData(userId: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", credirCart: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let change):
                print(change)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectationChangeUserData.fulfill()
        }
        wait(for: [expectationChangeUserData], timeout: 5.4)
    }
    func testCatalogData() {
        let catalogData = requestFactory.makeAuthRequestFatory()

        catalogData.catalogData(page_number: 1, id_category: 1) { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectationCatalogData.fulfill()
        }
        wait(for: [expectationCatalogData], timeout: 5.0)
    }
    func testGetGoodById() {
        let getGoodById = requestFactory.makeAuthRequestFatory()
        
        getGoodById.getGoodById(id_product: 123) { response in
            switch response.result {
            case .success(let good):
                print(good)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectationGetGoodById.fulfill()
        }
        wait(for: [expectationGetGoodById], timeout: 5.1)
    }
}
