//
//  HomeScreen.swift
//  brightcosmeticsSampleUITests
//
//  Created by Dilip M on 08/06/21.
//  Copyright © 2021 George FitzGibbons. All rights reserved.
//

import Foundation

public class HomeScreen: CommonUtility {
    
    let browsecatalogue = app.buttons[AccessibilityIndentifiers.Home.browsecatalogue].firstMatch
    
    func tapOnBrowsecatalogue() -> CatalogueScreen {
        
        tapOn(browsecatalogue,seconds: 5, action: .exists, description: "browsecatalogue in home screen/tapOnBrowsecatalogue")
        return CatalogueScreen()
    }
    
}
