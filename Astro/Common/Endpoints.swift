//
//  Endpoints.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://ams-api.astro.com.my"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Channels: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/ams/v3/getChannels"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
