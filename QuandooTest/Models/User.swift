//
//  User.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

struct User {
    
    var name: String
    var userName: String
    var email: String
    var address: String
    
    init(name: String, userName: String, email: String, address: String) {
        self.name = name
        self.userName = userName
        self.email = email
        self.address = address
    }
}
