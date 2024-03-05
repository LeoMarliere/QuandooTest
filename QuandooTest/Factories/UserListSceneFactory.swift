//
//  UserListFactory.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import UIKit

protocol UserListSceneFactoryProtocol {
    var configurator: UserListConfigurator! { get set }
    func makeLoginScene() -> UIViewController
}

final class UserListSceneFactory: UserListSceneFactoryProtocol {
    var configurator: UserListConfigurator!
    
    func makeLoginScene() -> UIViewController {
        let vc = UserListViewController()
        return configurator.configured(vc)
    }
}
