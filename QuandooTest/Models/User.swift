//
//  User.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

struct UserData: Codable, Equatable {
    
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
    static func == (lhs: UserData, rhs: UserData) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.username == rhs.username &&
        lhs.email == rhs.email &&
        lhs.address == rhs.address &&
        lhs.phone == rhs.phone &&
        lhs.website == rhs.website &&
        lhs.company == rhs.company
    }
}

struct Address: Codable, Equatable {
    
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
    
    static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.street == rhs.street &&
        lhs.suite == rhs.suite &&
        lhs.city == rhs.city &&
        lhs.zipcode == rhs.zipcode &&
        lhs.geo == rhs.geo
    }
}

struct Geo: Codable, Equatable {
    
    let lat: String
    let lng: String
    
    static func == (lhs: Geo, rhs: Geo) -> Bool {
        return lhs.lat == rhs.lat &&
        lhs.lng == rhs.lng
    }
}

struct Company: Codable, Equatable {
    
    let name: String
    let catchPhrase: String
    let bs: String
    
    static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.name == rhs.name &&
        lhs.catchPhrase == rhs.catchPhrase &&
        lhs.bs == rhs.bs
    }
}

struct User: Equatable {
    
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
        self.address = userData.address.street + " " + userData.address.suite + ", " + userData.address.zipcode + " " + userData.address.city
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.userID == rhs.userID &&
               lhs.name == rhs.name &&
               lhs.userName == rhs.userName &&
               lhs.email == rhs.email &&
               lhs.address == rhs.address
    }
}


