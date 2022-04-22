//
//  Commands.swift
//  GBShop
//
//  Created by Константин Каменчуков on 19.04.2022.
//

import Foundation
import Alamofire

class Commands: AbstractRequestFactory {
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

extension Commands: CommandsRequestFactory {
    
    func addReview(userId: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, userId: userId, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(commentId: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, commentId: commentId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func catalogReview(pageNumber: Int, completionHandler: @escaping (AFDataResponse<[CatalogReviewResult]>) -> Void) {
        let requestModel = CatalogReview(baseUrl: baseUrl, pageNumber: pageNumber)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
}

extension Commands {
    struct AddReview: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "addReview"
        
        let userId: Int
        let text: String
        
        var parameters: Parameters? {
            return [
                "userId": userId,
                "text": text
            ]
        }
    }
    
    struct RemoveReview: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "removeReview"
        
        let commentId: Int
        var parameters: Parameters? {
            return [
                "commentId": commentId
            ]
        }
    }
    struct CatalogReview: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "catalogReview"
        
        let pageNumber: Int
        var parameters: Parameters? {
            return [
                "pageNumber": pageNumber
            ]
        }
    }
    
}
