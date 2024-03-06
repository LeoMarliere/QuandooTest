//
//  UserPostViewController.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import UIKit

protocol PostsListViewControllerProtocol: AnyObject {
    func displayPostList(list: [Post])
}

class PostsListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    //MARK: Properties
    var interactor: PostsListInteractorProtocol?
    var postList: [Post] = []
    var userID: Int = 0
    
    private let screenTitle: String = "Posts List"
    private let cellIdentifier: String = "postCell"
    
    //MARK: UIComponent
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = screenTitle
        setupTableView()
        interactor?.fetchPostList(userID: String(self.userID))
    }
    
    //MARK: Private Methods
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(PostCellView.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    //MARK: Delegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PostCellView
        cell.configure(post: postList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 100
        
        let post = postList[indexPath.row]
        return PostCellView.height(for: post, width: tableView.bounds.width)
    }
}

extension PostsListViewController: PostsListViewControllerProtocol {
    
    func displayPostList(list: [Post]) {
        self.postList = list
        DispatchQueue.main.async { self.tableview.reloadData() }
    }
}
