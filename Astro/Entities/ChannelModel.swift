//
//  ChannelModel.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
import ObjectMapper

struct ChannelModel {
    var id = 0
    var number = ""
    var name = ""
    var category = ""
    var logo = ""
}

extension ChannelModel: Mappable {
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["channelId"]
        number <- map["channelStbNumber"]
        name <- map["channelTitle"]
        category <- map["channelCategory"]
        logo <- map["channelExtRef.0.value"]
    }
}
