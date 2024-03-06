//
//  UserTests.swift
//  QuandooTest
//
//  Created by Leo Marliere on 06/03/2024.
//

import XCTest
@testable import QuandooTest

class UserTests: XCTestCase {

    func test_UserInitializer() {
        let userData = UserData(id: 1,
                                name: "John Doe",
                                username: "johndoe",
                                email: "john@example.com",
                                address: Address(street: "123 Main St", suite: "Apt 101", city: "New York", zipcode: "10001", geo: Geo(lat: "40.7128", lng: "-74.0060")),
                                phone: "123-456-7890",
                                website: "www.example.com",
                                company: Company(name: "Example Company", catchPhrase: "Catchy Phrase", bs: "BS"))
        
        let user = User(userData: userData)
        
        XCTAssertEqual(user.userID, 1)
        XCTAssertEqual(user.name, "John Doe")
        XCTAssertEqual(user.userName, "johndoe")
        XCTAssertEqual(user.email, "john@example.com")
        XCTAssertEqual(user.address, "123 Main St Apt 101, 10001 New York")
    }
}
