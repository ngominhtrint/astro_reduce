//
//  ChannelListInteractor.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

class ChannelListInteractor: ChannelListInteractorInputProtocol {
    weak var presenter: ChannelListInteractorOutputProtocol?
    var localDataManager: ChannelListLocalDataManagerInputProtocol?
    var remoteDataManager: ChannelListRemoteDataManagerInputProtocol?
    
    func retrieveChannelList() {
        do {
            if let channels = try localDataManager?.retrieveChannelList() {
                let channelModelList = channels.map {
                    return ChannelModel(id: Int($0.id), number: $0.number!, name: $0.name!, category: $0.category!, logo: $0.logo!)
                }
                
                if channelModelList.isEmpty {
                    remoteDataManager?.retrieveChannelList()
                } else {
                    presenter?.didRetrieveChannels(channelModelList)
                }
            } else {
                remoteDataManager?.retrieveChannelList()
            }
        } catch {
            presenter?.didRetrieveChannels([])
        }
    }
}

extension ChannelListInteractor: ChannelListRemoteDataManagerOutputProtocol {
    func onChannelsRetrieved(_ channels: [ChannelModel]) {
        presenter?.didRetrieveChannels(channels)
        
        for channel in channels {
            do {
                try localDataManager?.saveChannel(id: channel.id, name: channel.name,
                                                  logo: channel.logo, category: channel.category,
                                                  number: channel.number)
            } catch {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
}
