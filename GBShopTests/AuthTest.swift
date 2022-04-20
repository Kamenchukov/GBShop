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
    let expectation = XCTestExpectation(description: "login")
    let expectationLogout = XCTestExpectation(description: "logout")
    let expectationRegisterUser = XCTestExpectation(description: "register")
    let expectationChangeUserData = XCTestExpectation(description: "changeUserData")
    let expectationCatalogData = XCTestExpectation(description: "catalog")
    let expectationGetGoodById = XCTestExpectation(description: "getGoodById")
    
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
        
        login.login(userName: "konstantin", password: "pas$w0rd") { response in
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
        
        logout.logout(userId: 123) { response in
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
        
        registerUser.registrationUser(username: "Konstantin", password: "pas$w0rd", email: "konstantin@kamenchukov.ru", gender: "male", credirCart: "1234123412341234", bio: "the best") { response in
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
        
        changeUserData.changingData(userId: 123, userName: "Konstantin", password: "pas$w0rd", email: "konstantin@kamenchukov.ru", gender: "male", credirCart: "1234123412341234", bio: "Customer") { response in
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

        catalogData.catalogData(pageNumber: 1, categoryId: 1) { response in
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
        
        getGoodById.getGoodById(productId: 123) { response in
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
