//
//  UsersListPresenterTests.swift
//  QuandooTestTests
//
//  Created by Leo Marliere on 06/03/2024.
//

import XCTest
@testable import QuandooTest

class UsersListPresenterTests: XCTestCase {
    
    class MockUsersListViewController: UsersListViewControllerProtocol {
        var displayUserListCallCount = 0
        var displayedUserList: [User] = []
        
        func displayUserList(list: [User]) {
            displayUserListCallCount += 1
            displayedUserList = list
        }
    }
    
    var sut: UsersListPresenter!
    var mockView: MockUsersListViewController!
    
    override func setUp() {
        super.setUp()
        sut = UsersListPresenter()
        mockView = MockUsersListViewController()
        sut.view = mockView
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        super.tearDown()
    }
    
    func test_PresentUserList() {

        let userData = UserData(id: 1, name: "John Doe", username: "johndoe", email: "john@example.com", address: Address(street: "123 Main St", suite: "Apt 101", city: "New York", zipcode: "10001", geo: Geo(lat: "40.7128", lng: "-74.0060")), phone: "123-456-7890", website: "www.example.com", company: Company(name: "Example Company", catchPhrase: "Catchy Phrase", bs: "BS"))
        
        let expectedUserList: [User] = [User(userData: userData)]
        sut.presentUserList(userDataList: [userData])
        
        XCTAssertEqual(mockView.displayUserListCallCount, 1)
        XCTAssertEqual(mockView.displayedUserList, expectedUserList)
    }
}
