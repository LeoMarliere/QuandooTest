//
//  PostsView.swift
//  QuandooTest
//
//  Created by Leo Marliere on 06/03/2024.
//

import SwiftUI

struct PostsContentView: View {

    let posts: [Post] // Assuming you have an array of Post
    
    var body: some View {
        List {
            ForEach(posts, id: \.id) { post in
                PostRow(post: post)
            }
        }
        .navigationTitle("Posts")
    }
}

/*struct PostRow: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
            Text(post.body)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}*/

