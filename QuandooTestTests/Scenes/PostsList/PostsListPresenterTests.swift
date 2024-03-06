//
//  PostsListPresenterTests.swift
//  QuandooTestTests
//
//  Created by Leo Marliere on 06/03/2024.
//
import XCTest
@testable import QuandooTest

class PostsListPresenterTests: XCTestCase {
    
    class MockViewController: PostsListViewControllerProtocol {
        var displayPostListCalled = false
        var displayedPostList: [Post]?
        
        func displayPostList(list: [Post]) {
            displayPostListCalled = true
            displayedPostList = list
        }
    }
    
    var presenter: PostsListPresenter!
    var mockViewController: MockViewController!
    
    override func setUp() {
        super.setUp()
        presenter = PostsListPresenter()
        mockViewController = MockViewController()
        presenter.view = mockViewController
    }
    
    override func tearDown() {
        presenter = nil
        mockViewController = nil
        super.tearDown()
    }
    
    func test_PresentPostList() {
        let postDataList = [
            PostData(userId: 1, id: 1, title: "Title 1", body: "Body 1"),
            PostData(userId: 1, id: 2, title: "Title 2", body: "Body 2")
        ]
        
        presenter.presentPostList(postDataList: postDataList)
        
        XCTAssertTrue(mockViewController.displayPostListCalled, "displayPostList should be called")
        XCTAssertEqual(mockViewController.displayedPostList?.count, postDataList.count, "Displayed post list count should match input post data list count")
        XCTAssertEqual(mockViewController.displayedPostList?[0].title, "Title 1", "First post title should match")
        XCTAssertEqual(mockViewController.displayedPostList?[0].body, "Body 1", "First post body should match")
        XCTAssertEqual(mockViewController.displayedPostList?[1].title, "Title 2", "Second post title should match")
        XCTAssertEqual(mockViewController.displayedPostList?[1].body, "Body 2", "Second post body should match")
    }
}
