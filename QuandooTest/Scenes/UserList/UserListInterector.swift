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
}

extension UserListInteractor: UserListInteractorProtocol {
    
    func fetchUserList() {
        presenter?.presentUserList()
    }
}
