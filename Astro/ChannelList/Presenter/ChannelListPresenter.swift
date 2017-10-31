//
//  ChannelListPresenter.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

class ChannelListPresenter: ChannelListPresenterProtocol {
    
    weak var view: ChannelListViewProtocol?
    var interactor: ChannelListInteractorInputProtocol?
    var wireframe: ChannelListWireframeProtocol?
    
    func viewDidload() {
        view?.showLoading()
        interactor?.retrieveChannelList()
    }
    
    func showChannelDetail(forChannel channel: ChannelModel) {
        wireframe?.presentChannelDetailScreen(from: view!, forChannel: channel)
    }
}

extension ChannelListPresenter: ChannelListInteractorOutputProtocol {
    func didRetrieveChannels(_ channels: [ChannelModel]) {
        view?.hideLoading()
        view?.showChannels(with: channels)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}
