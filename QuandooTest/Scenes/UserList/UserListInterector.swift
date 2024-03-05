//
//  UserListInterector.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UserListInteractorProtocol: AnyObject {
    func fetchUserList()
}

class UserListInteractor {
    var presenter: UserListPresenterProtocol?
    var apiManager: APIManagerProtocol?
    
    private let userURL = "https://jsonplaceholder.typicode.com/users"
}

extension UserListInteractor: UserListInteractorProtocol {
    
    func fetchUserList() {
        apiManager?.fetchUserData(url: userURL ) { userData in
            self.presenter?.presentUserList(userDataList: userData)
        }
    }
}
