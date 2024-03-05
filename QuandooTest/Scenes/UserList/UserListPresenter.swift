//
//  UserListPresenter.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UserListPresenterProtocol: AnyObject {
    func presentUserList(userDataList: [UserData])
}

class UserListPresenter {
    var view: UserListViewControllerProtocol?
}

extension UserListPresenter: UserListPresenterProtocol {
    
    func presentUserList(userDataList: [UserData]) {
        
        var myUserList: [User] = []
        for userData in userDataList {
            myUserList.append(User(userData: userData))
        }

        view?.displayUserList(list: myUserList)
    }
}
