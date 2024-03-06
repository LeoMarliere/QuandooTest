//
//  UserPostConfigurator.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import Foundation

protocol PostsListSceneConfiguratorProtocol {
    func configured(_ vc: PostsListViewController) -> PostsListViewController
}

final class PostsListConfigurator: PostsListSceneConfiguratorProtocol {
    private var sceneFactory: PostsListSceneFactoryProtocol
    
    init(sceneFactory: PostsListSceneFactoryProtocol) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: PostsListViewController) -> PostsListViewController {
        sceneFactory.configurator = self
        
        let interactor = PostsListInteractor()
        let presenter = PostsListPresenter()
        let apiManager = APIManager()

        presenter.view = vc
        interactor.presenter = presenter
        interactor.apiManager = apiManager
        vc.interactor = interactor
        
        return vc
    }
}
