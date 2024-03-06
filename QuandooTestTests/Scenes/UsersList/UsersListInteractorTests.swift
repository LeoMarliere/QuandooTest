//
//  UsersListInteractorTests.swift
//  QuandooTestTests
//
//  Created by Leo Marliere on 06/03/2024.
//
import XCTest
@testable import QuandooTest

class UsersListInteractorTests: XCTestCase {
    
    // Mock UsersListPresenter class
    class MockUsersListPresenter: UsersListPresenterProtocol {
        var presentUserListCalled = false
        var presentedUserData : [UserData]?
        
        func presentUserList(userDataList: [UserData]) {
            presentUserListCalled = true
            presentedUserData = userDataList
        }
    }
    
    // Mock APIManager class
    class MockAPIManager: APIManagerProtocol {
        var fetchDataCalled = false
        var fetchUserDataCompletionHandler: (([UserData]) -> Void)?
        
        let userData1 = UserData(id: 1,
                                name: "John Doe",
                                username: "johndoe",
                                email: "john@example.com",
                                address: Address(street: "123 Main St", suite: "Apt 101", city: "New York", zipcode: "10001", geo: Geo(lat: "40.7128", lng: "-74.0060")),
                                phone: "123-456-7890",
                                website: "www.example.com",
                                company: Company(name: "Example Company", catchPhrase: "Catchy Phrase", bs: "BS"))
        
        func fetchUserData(completion: @escaping ([UserData]) -> Void) {
            fetchDataCalled = true
            completion([userData1])
        }
        
        func fetchPostData(userID: String, completion: @escaping ([PostData]) -> Void) {}
    }
    
    var sut: UsersListInteractor!
    var mockPresenter: MockUsersListPresenter!
    var mockAPIManager: MockAPIManager!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockUsersListPresenter()
        mockAPIManager = MockAPIManager()
        
        sut = UsersListInteractor()
        sut.presenter = mockPresenter
        sut.apiManager = mockAPIManager
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        mockAPIManager = nil
        super.tearDown()
    }
    
    func test_FetchUserList() {
        sut.fetchUserList()
        
        let expectedUserData = [UserData(id: 1,
                                name: "John Doe",
                                username: "johndoe",
                                email: "john@example.com",
                                address: Address(street: "123 Main St", suite: "Apt 101", city: "New York", zipcode: "10001", geo: Geo(lat: "40.7128", lng: "-74.0060")),
                                phone: "123-456-7890",
                                website: "www.example.com",
                                company: Company(name: "Example Company", catchPhrase: "Catchy Phrase", bs: "BS"))]
        
        XCTAssertTrue(mockAPIManager.fetchDataCalled, "fetchDataCalled should be called")
        XCTAssertTrue(mockPresenter.presentUserListCalled, "presentUserListCalled should be called")
        XCTAssertEqual(mockPresenter.presentedUserData, expectedUserData)
        
    }
    
}
