//
//  UserListPresenter.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UserListPresenterProtocol: AnyObject {
    func presentUserList()
}

class UserListPresenter {
    var view: UserListViewControllerProtocol?
}

extension UserListPresenter: UserListPresenterProtocol {
    
    func presentUserList() {
        let user1 = User(name: "Leanne Graham", userName: "Bret", email: "Sincere@april.biz", address: "Greiswalder Strasse 211, 10405 Berlin")
        let user2 = User(name: "2", userName: "2", email: "2", address: "2")
        let user3 = User(name: "3", userName: "3", email: "3", address: "3")
        view?.displayUserList(list: [user1, user2, user3])
    }
}
