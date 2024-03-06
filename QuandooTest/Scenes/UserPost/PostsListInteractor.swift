//
//  UserPostInteractor.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol PostsListInteractorProtocol: AnyObject {
    func fetchPostList(userID: String)
}

class PostsListInteractor {
    var presenter: PostsListPresenterProtocol?
    var apiManager: APIManagerProtocol?
}

extension PostsListInteractor: PostsListInteractorProtocol {
    
    func fetchPostList(userID: String) {
        apiManager?.fetchPostData(userID: userID) { postData in
            self.presenter?.presentPostList(postDataList: postData)
        }
    }
}
