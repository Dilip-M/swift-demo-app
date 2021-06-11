//
//  brightcosmeticsSampleUITests.swift
//  brightcosmeticsSampleUITests
//
//  Created by Dilip M on 03/06/21.
//  Copyright © 2021 George FitzGibbons. All rights reserved.
//

import XCTest

class HomeUITests: BaseUITests {

    override func setUp() {
        super.setUp()
    }

    func testHomeTest1() {
        let productname = TestData.Catalogue.oil
        
        let testdata = "Test_data".localized
        print("testdata_value",testdata)
        HomeScreen()
            .tapOnBrowsecatalogue()
            .tapOnProduct(product: productname)
    }
    

    
    override func tearDown() {
        super.tearDown()
    }
}
