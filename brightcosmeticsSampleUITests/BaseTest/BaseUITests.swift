//
//  brightcosmeticsSampleUITests.swift
//  brightcosmeticsSampleUITests
//
//  Created by Dilip M on 03/06/21.
//  Copyright © 2021 George FitzGibbons. All rights reserved.
//

import XCTest

class BaseUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        app.terminate()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
