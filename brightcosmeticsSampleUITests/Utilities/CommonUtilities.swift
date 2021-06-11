//
//  CommonUtilities.swift
//  brightcosmeticsSampleUITests
//
//  Created by Dilip M on 08/06/21.
//  Copyright © 2021 George FitzGibbons. All rights reserved.
//

import Foundation
import XCTest

public class CommonUtilities {
    
    
}

extension String {
    var localized: String {
         
        let bundle = Bundle(for: CommonUtilities.self)
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle, value: "", comment: "")
    }
}

public protocol CommonUtility {
    func tapOn(_ element: XCUIElement, seconds: TimeInterval, action: TapAction, description: String)
    func checkForElement(_ element: XCUIElement, seconds: TimeInterval, action: CheckAction, description: String)
}

public enum TapAction {
    case exists, hittable, selected, location
}

public enum CheckAction {
    case exists, notExists, hittable, selected, notSelected, isDisabled
}

public extension CommonUtility {
    
    func tapOn(_ element: XCUIElement, seconds: TimeInterval = 30, action: TapAction = .hittable, description: String = "") {
        
        let elementExists = element.waitForExistence(timeout: seconds)
        
        switch action {
        
        case .exists:
            if elementExists {
                element.tap()
            }
            else {
                XCTAssertTrue(elementExists, "\(element) is not displayed. \(description)")
            }
        case .hittable:
            if element.isHittable {
                element.tap()
            }
            else if elementExists {
                element.tap()
            }
            else {
                XCTAssertTrue(element.isHittable, "\(element) is not displayed and tappable. \(description)")
            }
        case .selected:
            XCTAssertTrue(elementExists, "\(element) is not displayed. \(description)")
            if element.isSelected {
                element.tap()
            }
        case .location:
            let coordinate: XCUICoordinate = element.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 1.0))
            coordinate.tap()
        }
    }
    
    
    func checkForElement(_ element: XCUIElement, seconds: TimeInterval = 30, action: CheckAction = .exists, description: String = "") {
        
        let elementExists = element.waitForExistence(timeout: seconds)
        
        switch action {
        
        case .exists:
            XCTAssertTrue(elementExists, "Failed to verify \(element). \(description)")
        case .notExists:
            XCTAssertFalse(elementExists, "Failed to verify \(element). \(description)")
        case .hittable:
            if elementExists {
                XCTAssertTrue(element.isHittable, "Failed to verify \(element) tappable. \(description)")
            }
            else {
                XCTAssertTrue(elementExists, "Failed to verify \(element). \(description)")
            }
        case .selected:
            if elementExists {
                XCTAssertTrue(element.isSelected, "\(element) is not selected. \(description)")
            }
            else {
                XCTAssertTrue(elementExists, "Failed to verify \(element). \(description)")
            }
        case .notSelected:
            if elementExists {
                XCTAssertFalse(element.isSelected, "\(element) is selected. \(description)")
            }
            else {
                XCTAssertTrue(elementExists, "Failed to verify \(element). \(description)")
            }
        case .isDisabled:
            if elementExists {
                XCTAssertFalse(element.isEnabled, "\(element) is enabled. \(description)")
            }
            else {
                XCTAssertTrue(elementExists, "Failed to verify \(element). \(description)")
            }
        }
    }
}
