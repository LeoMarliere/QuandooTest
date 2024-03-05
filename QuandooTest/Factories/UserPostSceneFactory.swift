//
//  UserPostSceneFactory.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import UIKit

protocol UserPostSceneFactoryProtocol {
    var configurator: UserPostConfigurator! { get set }
    var userID: Int! { get set }
    
    func makeScene() -> UIViewController
}

final class UserPostSceneFactory: UserPostSceneFactoryProtocol {

    var configurator: UserPostConfigurator!
    var userID: Int!
    
    func makeScene() -> UIViewController {
        let vc = UserPostViewController()
        vc.userID = self.userID
        return configurator.configured(vc)
    }
}
