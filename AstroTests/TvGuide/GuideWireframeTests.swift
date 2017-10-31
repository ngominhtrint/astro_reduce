//
//  GuideWireframeTests.swift
//  AstroTests
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import XCTest
import UIKit
@testable import Astro

class GuideWireframeTests: XCTestCase {
    
    var view: UIViewController?
    
    override func setUp() {
        super.setUp()
        
        view = GuideWireframe.createGuideModule()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateGuideModule() {
        XCTAssertEqual(view?.title, "TV Guide")
    }
    
    func testNumberOfViewControllers() {
        let nav = view as! UINavigationController
        XCTAssertEqual(nav.viewControllers.count, 1)
    }
    
}
