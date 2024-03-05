//
//  User.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

import Foundation

struct UserData: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

struct User {
    
    var userID: Int
    var name: String
    var userName: String
    var email: String
    var address: String
    
    init(userData: UserData) {
        self.userID = userData.id
        self.name = userData.name
        self.userName = userData.username
        self.email = userData.email
        self.address = userData.address.street + " " + userData.address.suite + " , " + userData.address.zipcode + " " + userData.address.city
    }
}

