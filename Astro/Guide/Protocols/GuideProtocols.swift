//
//  GuideProtocols.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

// TODO - Presenter -> Wireframe
protocol GuideWireframeProtocol: class {
    
    static func createGuideModule() -> UIViewController
    
    // Conform by Wireframe. Presenter calls, Wireframe listens.
}
