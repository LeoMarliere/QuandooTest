//
//  UserPostPresenter.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UserPostPresenterProtocol: AnyObject {
    func presentPostList(postDataList: [PostData])
}

class UserPostPresenter {
    var view: UserPostViewControllerProtocol?
}

extension UserPostPresenter: UserPostPresenterProtocol {
    
    func presentPostList(postDataList: [PostData]) {

        var myPostList: [Post] = []
        for postData in postDataList {
            myPostList.append(Post(postData: postData))
        }

        view?.displayPostList(list: myPostList)
    }
}
