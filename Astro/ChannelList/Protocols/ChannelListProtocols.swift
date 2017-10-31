//
//  ChannelListProtocols.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

// TODO - Presenter -> View
protocol ChannelListViewProtocol: class {
    
    var presenter: ChannelListPresenterProtocol? { get set }
    
    // Conform by View. Presenter calls, View listens.
    func showChannels(with channels: [ChannelModel])
    func showError()
    func showLoading()
    func hideLoading()
}

// TODO - Presenter -> Wireframe
protocol ChannelListWireframeProtocol: class {
    
    static func createChannelListModule() -> UIViewController
    
    // Conform by Wireframe. Presenter calls, Wireframe listens.
    func presentChannelDetailScreen(from view: ChannelListViewProtocol, forChannel channel: ChannelModel)
}

// TODO - View -> Presenter
protocol ChannelListPresenterProtocol: class {
    
    // Conform by Presenter. View calls, Presenter listens.
    var view: ChannelListViewProtocol? { get set }
    var interactor: ChannelListInteractorInputProtocol? { get set }
    var wireframe: ChannelListWireframeProtocol? { get set }
    
    func viewDidload()
    func showChannelDetail(forChannel channel: ChannelModel)
}

// TODO - Interactor -> Presenter
protocol ChannelListInteractorOutputProtocol: class {
    
    // Conform by Presenter. Interactor calls, Presenter listens.
    func didRetrieveChannels(_ channels: [ChannelModel])
    func onError()
}

// TODO - Presenter -> Interactor
protocol ChannelListInteractorInputProtocol: class {
    var presenter: ChannelListInteractorOutputProtocol? { get set }
    var localDataManager: ChannelListLocalDataManagerInputProtocol? { get set }
    var remoteDataManager: ChannelListRemoteDataManagerInputProtocol? { get set }
    
    // Conform by Interactor. Presenter calls, Interactor listens.
    func retrieveChannelList()
}

// TODO - Interactor -> DataManager
protocol ChannelListDataManagerInputProtocol: class {
    
}

// TODO - Interactor -> LocalDataManager
protocol ChannelListLocalDataManagerInputProtocol: class {
    
    // Conform by LocalDataManager. Interactor calls, LocalDataManager listens
    func retrieveChannelList() throws -> [Channel]
    func saveChannel(id: Int, name: String, logo: String, category: String, number: String) throws
}

// TODO - Interactor -> RemoteDataManager
protocol ChannelListRemoteDataManagerInputProtocol: class {
    
    var remoteRequestsHandler: ChannelListRemoteDataManagerOutputProtocol? { get set }
    // Conform by RemoteDataManager. Interactor calls, RemoteDataManager listens
    func retrieveChannelList()
}

// TODO - RemoteDataManager -> Interactor
protocol ChannelListRemoteDataManagerOutputProtocol: class {
    
    // Conform by Interactor. RemoteDataManager calls, Interactor listens
    func onChannelsRetrieved(_ channels: [ChannelModel])
    func onError()
}
