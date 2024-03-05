//
//  UserListViewController.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import UIKit

protocol UserListViewControllerProtocol: AnyObject {
    func displayUserList(list: [User])
}

class UserListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    //MARK: Properties
    var interactor: UserListInteractorProtocol?
    var userList: [User] = []
    
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
        setupTableView()
        interactor?.fetchUserList()
    }
    
    //MARK: Private Methods
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UserCellView.self, forCellReuseIdentifier: "userCell")
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
        let cell = tableview.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCellView
        cell.configure(user: userList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        let user = userList[indexPath.row]
        let sceneFactory = UserPostSceneFactory()
        sceneFactory.configurator = UserPostConfigurator(sceneFactory: sceneFactory)
        sceneFactory.userID = user.userID
        navigationController?.pushViewController(sceneFactory.makeScene(), animated: true)
    }
}

extension UserListViewController: UserListViewControllerProtocol {
    
    func displayUserList(list: [User]) {
        self.userList = list
        DispatchQueue.main.async { self.tableview.reloadData() }
    }
}
