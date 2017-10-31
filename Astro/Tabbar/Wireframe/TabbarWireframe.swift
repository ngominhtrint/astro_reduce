//
//  TabbarWireframe.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import UIKit

class TabbarWireframe {
    
    static func createTabbar() -> UITabBarController {
        let viewControllers = [UIViewController]()
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = viewControllers
        
        return tabbarController
    }
}
