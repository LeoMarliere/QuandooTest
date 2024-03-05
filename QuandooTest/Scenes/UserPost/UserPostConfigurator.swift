//
//  UserPostConfigurator.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol UserPostSceneConfiguratorProtocol {
    func configured(_ vc: UserPostViewController) -> UserPostViewController
}

final class UserPostConfigurator: UserPostSceneConfiguratorProtocol {
    private var sceneFactory: UserPostSceneFactoryProtocol
    
    init(sceneFactory: UserPostSceneFactoryProtocol) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: UserPostViewController) -> UserPostViewController {
        sceneFactory.configurator = self
        
        let interactor = UserPostInteractor()
        let presenter = UserPostPresenter()
        let apiManager = APIManager()

        presenter.view = vc
        interactor.presenter = presenter
        interactor.apiManager = apiManager
        vc.interactor = interactor
        
        return vc
    }
}
