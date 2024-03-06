//
//  UserPostSceneFactory.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import UIKit

protocol PostsListSceneFactoryProtocol {
    var configurator: PostsListConfigurator! { get set }
    var userID: Int! { get set }
    func makeScene() -> UIViewController
}

final class PostsListSceneFactory: PostsListSceneFactoryProtocol {

    var configurator: PostsListConfigurator!
    var userID: Int!
    
    func makeScene() -> UIViewController {
        let vc = PostsListViewController()
        vc.userID = self.userID
        return configurator.configured(vc)
    }
}
