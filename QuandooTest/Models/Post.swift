//
//  Post.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

struct PostData: Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    static func == (lhs: PostData, rhs: PostData) -> Bool {
        return lhs.userId == rhs.userId &&
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.body == rhs.body
    }
}

struct Post: Identifiable {
    
    var id: Int
    var title: String
    var body: String
    
    init(postData: PostData) {
        self.id = postData.id
        self.title = postData.title
        self.body = postData.body
    }
}
