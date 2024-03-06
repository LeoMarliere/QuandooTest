//
//  UserListPresenter.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UsersListPresenterProtocol: AnyObject {
    
    func presentUserList(userDataList: [UserData])
}

class UsersListPresenter {
    
    var view: UsersListViewControllerProtocol?
}

extension UsersListPresenter: UsersListPresenterProtocol {
    
    func presentUserList(userDataList: [UserData]) {
        
        var myUserList: [User] = []
        for userData in userDataList {
            myUserList.append(User(userData: userData))
        }

        view?.displayUserList(list: myUserList)
    }
}
