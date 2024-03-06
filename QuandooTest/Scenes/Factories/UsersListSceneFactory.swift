//
//  UserListFactory.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import UIKit

protocol UsersListSceneFactoryProtocol {
    var configurator: UsersListConfigurator! { get set }
    func makeScene() -> UIViewController
}

final class UsersListSceneFactory: UsersListSceneFactoryProtocol {
    var configurator: UsersListConfigurator!
    
    func makeScene() -> UIViewController {
        let vc = UsersListViewController()
        return configurator.configured(vc)
    }
}
