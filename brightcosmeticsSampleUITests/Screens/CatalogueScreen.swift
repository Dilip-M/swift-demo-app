//
//  HomeScreen.swift
//  brightcosmeticsSampleUITests
//
//  Created by Dilip M on 08/06/21.
//  Copyright © 2021 George FitzGibbons. All rights reserved.
//

import Foundation

public class CatalogueScreen: CommonUtility {
    
    func tapOnProduct(product: String) {
        let product = app.staticTexts[product].firstMatch
        tapOn(product, action: .exists, description: "\(product) product in catalogue screen/tapOnProduct")
    }
}
