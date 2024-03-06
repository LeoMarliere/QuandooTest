//
//  PostsListViewControllerTests.swift
//  QuandooTestTests
//
//  Created by Leo Marliere on 06/03/2024.
//

import XCTest
import SwiftUI
@testable import QuandooTest

class PostsListViewControllerTests: XCTestCase {
    
    class MockPostsListInteractor: PostsListInteractorProtocol {
        var fetchPostListCalled = false
        
        func fetchPostList(userID: String) {
            fetchPostListCalled = true
        }
    }
    
    var sut: PostsListViewController!
    var interactor: MockPostsListInteractor!
    
    override func setUp() {
        super.setUp()
        sut = PostsListViewController()
        interactor = MockPostsListInteractor()
        sut.interactor = interactor
        _ = sut.view
    }
    
    override func tearDown() {
        sut = nil
        interactor = nil
        super.tearDown()
    }
    
    func test_ViewDidLoad() {
        XCTAssertTrue(interactor.fetchPostListCalled)
    }
    
    func testDisplayPostList() {
        let post1 = Post(postData: PostData(userId: 1,id: 1, title: "Test Post 1", body: "Test body 1"))
        let post2 = Post(postData: PostData(userId: 2,id: 2, title: "Test Post 2", body: "Test body 2"))
        let expectedPosts: [Post] = [post1, post2]

         sut.displayPostList(list: expectedPosts)
         
         XCTAssertEqual(sut.viewModel.posts, expectedPosts)
         XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), expectedPosts.count)
     }
}
