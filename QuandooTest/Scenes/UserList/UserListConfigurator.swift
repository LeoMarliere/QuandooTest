//
//  UserListConfigurator.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UserListSceneConfiguratorProtocol {
    func configured(_ vc: UserListViewController) -> UserListViewController
}

final class UserListConfigurator: UserListSceneConfiguratorProtocol {
    private var sceneFactory: UserListSceneFactoryProtocol
    
    init(sceneFactory: UserListSceneFactoryProtocol) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: UserListViewController) -> UserListViewController {
        sceneFactory.configurator = self
        
        let interactor = UserListInteractor()
        let presenter = UserListPresenter()

        presenter.view = vc
        interactor.presenter = presenter
        vc.interactor = interactor
        
        return vc
    }
}
