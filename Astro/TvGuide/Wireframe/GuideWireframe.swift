//
//  GuideWireframe.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

class GuideWireframe: GuideWireframeProtocol {
    
    static func createGuideModule() -> UIViewController {
        let navController = UINavigationController()
        let view = GuideView(nibName: "GuideView", bundle: nil)
        
        navController.viewControllers = [view]
        navController.title = "TV Guide"
        return navController
    }
}
