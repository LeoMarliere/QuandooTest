//
//  UserListInterector.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UsersListInteractorProtocol: AnyObject {
    
    func fetchUserList()
}

class UsersListInteractor {
    
    var presenter: UsersListPresenterProtocol?
    var apiManager: APIManagerProtocol?
}

extension UsersListInteractor: UsersListInteractorProtocol {
    
    func fetchUserList() {
        apiManager?.fetchUserData() { userData in
            self.presenter?.presentUserList(userDataList: userData)
        }
    }
}
