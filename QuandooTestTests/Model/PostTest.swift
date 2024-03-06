//
//  PostTest.swift
//  QuandooTestTests
//
//  Created by Leo Marliere on 06/03/2024.
//

import XCTest
@testable import QuandooTest

class PostTests: XCTestCase {

    func test_PostInitializer() {
        let postData = PostData(userId: 1, id: 101, title: "Sample Title", body: "Sample Body")
        
        let post = Post(postData: postData)
        
        XCTAssertEqual(post.id, 101)
        XCTAssertEqual(post.title, "Sample Title")
        XCTAssertEqual(post.body, "Sample Body")
    }
}

