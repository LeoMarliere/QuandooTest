//
//  Post.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

struct PostData: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct Post {
    
    var id: Int
    var title: String
    var body: String
    
    init(postData: PostData) {
        self.id = postData.id
        self.title = postData.title
        self.body = postData.body
    }
}
