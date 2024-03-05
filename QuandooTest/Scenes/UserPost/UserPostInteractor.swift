//
//  UserPostInteractor.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UserPostInteractorProtocol: AnyObject {
    func fetchPostList(userID: String)
}

class UserPostInteractor {
    var presenter: UserPostPresenterProtocol?
    var apiManager: APIManagerProtocol?
    
    private let postURL = "https://jsonplaceholder.typicode.com/posts?userId="
}

extension UserPostInteractor: UserPostInteractorProtocol {
    
    func fetchPostList(userID: String) {
        apiManager?.fetchPostData(url: postURL+userID) { postData in
            self.presenter?.presentPostList(postDataList: postData)
        }
    }
}
