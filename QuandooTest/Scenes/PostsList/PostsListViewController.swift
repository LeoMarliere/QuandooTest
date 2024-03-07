//
//  UserPostViewController.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import SwiftUI

struct PostRow: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(post.title)
                .font(.headline)
                .underline(true)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
            Text(post.body)
                .font(.subheadline)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
        }
        .padding(8)
        .cornerRadius(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

protocol PostsListViewControllerProtocol: AnyObject {
    
    func displayPostList(list: [Post])
}

class PostsListViewController: UITableViewController {
    
    //MARK: Properties
    private var posts: [Post] = []
    var interactor: PostsListInteractorProtocol?
    var userID: Int = 0
    
    private let screenTitle: String = "Posts List"
    private let cellIdentifier: String = "postCell"
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = screenTitle
        view.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        interactor?.fetchPostList(userID: String(self.userID))
    }
    
    //MARK: UITableViewController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration(content: {
            PostRow(post: posts[indexPath.row])
        })
        
        return cell
    }
}

extension PostsListViewController: PostsListViewControllerProtocol {
    
    func displayPostList(list: [Post]) {
        self.posts = list
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
}
