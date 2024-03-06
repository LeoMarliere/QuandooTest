//
//  UserListConfigurator.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UsersListSceneConfiguratorProtocol {
    
    func configured(_ vc: UsersListViewController) -> UsersListViewController
}

final class UsersListConfigurator: UsersListSceneConfiguratorProtocol {
    
    private var sceneFactory: UsersListSceneFactoryProtocol
    
    init(sceneFactory: UsersListSceneFactoryProtocol) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: UsersListViewController) -> UsersListViewController {
        sceneFactory.configurator = self
        
        let interactor = UsersListInteractor()
        let presenter = UsersListPresenter()
        let apiManager = APIManager()

        presenter.view = vc
        interactor.presenter = presenter
        interactor.apiManager = apiManager
        vc.interactor = interactor
        
        return vc
    }
}
