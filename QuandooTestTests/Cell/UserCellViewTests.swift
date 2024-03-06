//
//  QuandooTestTests.swift
//  QuandooTestTests
//
//  Created by Leo Marliere on 05/03/2024.
//

import XCTest
@testable import QuandooTest

final class UserCellViewTests: XCTestCase {
    
    var cellView: UserCellView!
    
    override func setUp() {
        super.setUp()
        cellView = UserCellView()
    }
    
    override func tearDown() {
        cellView = nil
        super.tearDown()
    }
    
    func test_Configure() {
        
        let userData = UserData(id: 1,
                                name: "John Doe",
                                username: "johndoe",
                                email: "john@example.com",
                                address: Address(street: "123 Main St", suite: "Apt 101", city: "New York", zipcode: "10001", geo: Geo(lat: "40.7128", lng: "-74.0060")),
                                phone: "123-456-7890",
                                website: "www.example.com",
                                company: Company(name: "Example Company", catchPhrase: "Catchy Phrase", bs: "BS"))
        
        let user = User(userData: userData)
        cellView.configure(user: user)
        
        XCTAssertEqual(cellView.nameLabel.text, "John Doe")
        XCTAssertEqual(cellView.userNameLabel.text, "johndoe")
        XCTAssertEqual(cellView.emailLabel.text, "john@example.com")
        XCTAssertEqual(cellView.addressLabel.text, "123 Main St Apt 101, 10001 New York")
    }
}
