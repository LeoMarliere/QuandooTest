//
//  PostsListInteractorTests.swift
//  QuandooTestTests
//
//  Created by Leo Marliere on 06/03/2024.
//

import XCTest
@testable import QuandooTest

class PostsListInteractorTests: XCTestCase {
    
    class MockAPIManager: APIManagerProtocol {
        var fetchedPostData: [PostData]?
        var fetchPostDataCalled = false
        
        func fetchUserData(completion: @escaping ([UserData]) -> Void) {}
        
        func fetchPostData(userID: String, completion: @escaping ([PostData]) -> Void) {
            fetchPostDataCalled = true
            if let fetchedPostData = fetchedPostData {
                completion(fetchedPostData)
            }
        }
    }
    
    class MockPresenter: PostsListPresenterProtocol {
        var presentPostListCalled = false
        
        func presentPostList(postDataList: [PostData]) {
            presentPostListCalled = true
        }
    }
    
    var interactor: PostsListInteractor!
    var mockAPIManager: MockAPIManager!
    var mockPresenter: MockPresenter!
    
    override func setUp() {
        super.setUp()
        mockAPIManager = MockAPIManager()
        mockPresenter = MockPresenter()
        interactor = PostsListInteractor()
        interactor.apiManager = mockAPIManager
        interactor.presenter = mockPresenter
    }
    
    override func tearDown() {
        mockAPIManager = nil
        mockPresenter = nil
        interactor = nil
        super.tearDown()
    }
    
    func test_FetchPostList() {
        let userID = "1"
        let expectedPostData = [PostData(userId: 1, id: 1, title: "Post 1", body: "Body of post 1")]
        mockAPIManager.fetchedPostData = expectedPostData
        
        interactor.fetchPostList(userID: userID)
        
        XCTAssertTrue(mockAPIManager.fetchPostDataCalled, "fetchPostData should be called")
        XCTAssertTrue(mockPresenter.presentPostListCalled, "presentPostList should be called")
    }
}
