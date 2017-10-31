//
//  ChannelListRemoteDataManager.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ChannelListRemoteDataManager: ChannelListRemoteDataManagerInputProtocol {
    
    var remoteRequestsHandler: ChannelListRemoteDataManagerOutputProtocol?
    
    func retrieveChannelList() {
        Alamofire
            .request(Endpoints.Channels.fetch.url, method: .get, encoding: JSONEncoding.default)
            .validate()
            .responseObject { (response: DataResponse<ResponseModel>) in
                switch response.result {
                case .success(let responseModel):
                    self.remoteRequestsHandler?.onChannelsRetrieved(responseModel.channels)
                case .failure(_):
                    self.remoteRequestsHandler?.onError()
                }
        }
    }
}
