//
//  ResponseModel.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResponseModel {
    var responseCode = ""
    var responseMessage = ""
    var channels = [ChannelModel]()
}

extension ResponseModel: Mappable {
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        responseCode <- map["responseCode"]
        responseMessage <- map["responseMessage"]
        channels <- map["channel"]
    }
}
