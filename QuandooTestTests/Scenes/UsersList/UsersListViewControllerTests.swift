//
//  UsersListViewControllerTests.swift
//  QuandooTestTests
//
//  Created by Leo Marliere on 06/03/2024.
//

import XCTest
@testable import QuandooTest

class UsersListViewControllerTests: XCTestCase {
    
    var sut: UsersListViewController!
    var mockInteractor: MockUsersListInteractor!
    
    override func setUp() {
        super.setUp()
        sut = UsersListViewController()
        mockInteractor = MockUsersListInteractor()
        sut.interactor = mockInteractor
        _ = sut.view
    }
    
    override func tearDown() {
        sut = nil
        mockInteractor = nil
        super.tearDown()
    }
    
    func test_ViewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(mockInteractor.fetchUserListCalled)
    }
    
    func test_DisplayUserList() {

        let userData1 = UserData(id: 1,
                                name: "John Doe",
                                username: "johndoe",
                                email: "john@example.com",
                                address: Address(street: "123 Main St", suite: "Apt 101", city: "New York", zipcode: "10001", geo: Geo(lat: "40.7128", lng: "-74.0060")),
                                phone: "123-456-7890",
                                website: "www.example.com",
                                company: Company(name: "Example Company", catchPhrase: "Catchy Phrase", bs: "BS"))
        
        let userData2 = UserData(id: 2,
                                 name: "Alice Johnson",
                                 username: "alicej",
                                 email: "alice@example.com",
                                 address: Address(street: "456 Elm St", suite: "Suite 202", city: "Los Angeles", zipcode: "90001", geo: Geo(lat: "34.0522", lng: "-118.2437")),
                                 phone: "987-654-3210",
                                 website: "www.alice.com",
                                 company: Company(name: "ABC Corporation", catchPhrase: "Building Dreams", bs: "Business Strategy"))

        let user1 = User(userData: userData1)
        let user2 = User(userData: userData2)
        let userList = [user1, user2]
        
        sut.displayUserList(list: userList)

        let numberOfRows = sut.tableView(sut.tableview, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, userList.count)
        
        for (index, user) in userList.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            guard let cell = sut.tableView(sut.tableview, cellForRowAt: indexPath) as? UserCellView else {
                XCTFail("Failed to dequeue cell")
                return
            }
            XCTAssertEqual(cell.nameLabel.text, user.name)
            XCTAssertEqual(cell.userNameLabel.text, user.userName)
            XCTAssertEqual(cell.emailLabel.text, user.email)
            XCTAssertEqual(cell.addressLabel.text, user.address)
        }
    }
    
    func test_DidSelectRow() {
        let mockNavigationController = MockNavigationController()
        mockNavigationController.pushViewController(sut, animated: false)
        let window = UIWindow()
        window.rootViewController = mockNavigationController
        window.makeKeyAndVisible()
    
        let userData = UserData(id: 1,
                                name: "John Doe",
                                username: "johndoe",
                                email: "john@example.com",
                                address: Address(street: "123 Main St", suite: "Apt 101", city: "New York", zipcode: "10001", geo: Geo(lat: "40.7128", lng: "-74.0060")),
                                phone: "123-456-7890",
                                website: "www.example.com",
                                company: Company(name: "Example Company", catchPhrase: "Catchy Phrase", bs: "BS"))

        let user = User(userData: userData)
        let userList = [user]
        
        sut.displayUserList(list: userList)
        
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(sut.tableview, didSelectRowAt: indexPath)
        
        XCTAssertTrue(mockNavigationController.pushedViewController is PostsListViewController)
        
        guard let postsListViewController = mockNavigationController.pushedViewController as? PostsListViewController else {
            XCTFail("Failed to push PostsListViewController")
            return
        }
        XCTAssertEqual(postsListViewController.userID, user.userID)
    }
}

// Mock UsersListInteractor for testing
class MockUsersListInteractor: UsersListInteractorProtocol {
    var fetchUserListCalled = false
    
    func fetchUserList() {
        fetchUserListCalled = true
    }
}

class MockNavigationController: UINavigationController {
        var pushedViewController: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }

