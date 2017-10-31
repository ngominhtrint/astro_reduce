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
        
        // Create Channel List module
        let channelListView = ChannelListWireframe.createChannelListModule()
        
        // Create Guide module
        let guideView = GuideWireframe.createGuideModule()
        
        var viewControllers = [UIViewController]()
        viewControllers.append(channelListView)
        viewControllers.append(guideView)
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = viewControllers
        
        return tabbarController
    }
}
