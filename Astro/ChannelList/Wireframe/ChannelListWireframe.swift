//
//  ChannelListWireframe.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

class ChannelListWireframe: ChannelListWireframeProtocol {
    
    static func createChannelListModule() -> UIViewController {
        let navController = UINavigationController()
        let view = ChannelListView(nibName: "ChannelListView", bundle: nil)
        
        let presenter: ChannelListPresenterProtocol & ChannelListInteractorOutputProtocol = ChannelListPresenter()
        let interactor: ChannelListInteractorInputProtocol & ChannelListRemoteDataManagerOutputProtocol = ChannelListInteractor()
        let localDataManager: ChannelListLocalDataManagerInputProtocol = ChannelListLocalDataManager()
        let remoteDataManager: ChannelListRemoteDataManagerInputProtocol = ChannelListRemoteDataManager()
        let wireframe: ChannelListWireframeProtocol = ChannelListWireframe()
            
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteRequestsHandler = interactor
            
        navController.viewControllers = [view]
        navController.title = "Channels"
        return navController
    }
    
    func presentChannelDetailScreen(from view: ChannelListViewProtocol, forChannel channel: ChannelModel) {

    }
}
