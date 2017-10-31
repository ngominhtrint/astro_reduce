//
//  ChannelListWireframeTests.swift
//  AstroTests
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import XCTest
import UIKit
@testable import Astro

class ChannelListWireframeTests: XCTestCase {
    
    var view: UIViewController?
    
    override func setUp() {
        super.setUp()
        
        view = ChannelListWireframe.createChannelListModule()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateChannelListModule() {
        XCTAssertEqual(view?.title, "Channels")
    }
    
    func testNumberOfViewControllers() {
        let nav = view as! UINavigationController
        XCTAssertEqual(nav.viewControllers.count, 1)
    }
}
