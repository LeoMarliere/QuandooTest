//
//  UserListViewController.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import UIKit

protocol UsersListViewControllerProtocol: AnyObject {
    func displayUserList(list: [User])
}

class UsersListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    //MARK: Properties
    var interactor: UsersListInteractorProtocol?
    var userList: [User] = []
    
    private let screenTitle: String = "Users List"
    private let cellIdentifier: String = "userCell"
    private let cellSize: CGFloat = 120
    
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
        interactor?.fetchUserList()
    }
    
    //MARK: Private Methods
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UserCellView.self, forCellReuseIdentifier: cellIdentifier)
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
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserCellView
        cell.configure(user: userList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellSize
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        let user = userList[indexPath.row]
        let sceneFactory = PostsListSceneFactory()
        sceneFactory.configurator = PostsListConfigurator(sceneFactory: sceneFactory)
        sceneFactory.userID = user.userID
        navigationController?.pushViewController(sceneFactory.makeScene(), animated: true)
    }
}

extension UsersListViewController: UsersListViewControllerProtocol {
    
    func displayUserList(list: [User]) {
        self.userList = list
        DispatchQueue.main.async { self.tableview.reloadData() }
    }
}
