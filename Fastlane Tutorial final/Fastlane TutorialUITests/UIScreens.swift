//
//  UIScreens.swift
//  Fastlane TutorialUITests
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//

import XCTest

struct DefaultMainScreen: MainScreen {
    var pageIdentifier: XCUIElement {
        return XCUIApplication().otherElements["__PageName__Mainscreen"]
    }
    
    var titleLabel: XCUIElement {
        return pageIdentifier.navigationBars.staticTexts["Home View Controller"]
    }
    
    var topSwitch: XCUIElement {
        return pageIdentifier.tables.cells.element(boundBy: 0).children(matching: .switch).element
    }
    var middleSwitch: XCUIElement {
        return pageIdentifier.tables.cells.element(boundBy: 3).children(matching: .switch).element
    }
    var lastSwitch: XCUIElement {
        return pageIdentifier.tables.cells.element(boundBy: 4).children(matching: .switch).element
    }
    
    var detailCell: XCUIElement {
        return pageIdentifier.tables.cells.element(boundBy: 1).children(matching: .button).element
    }
    
    var tableFooter: XCUIElement {
        return pageIdentifier.tables.otherElements.staticTexts["table_footer"]
    }
    
    func didSelectDisclosureIndecator(_ element: XCUIElement) {
        if element.exists && element.isHittable {
            element.tap()
        }
    }
    
    func validate() {
        if !pageIdentifier.exists && !titleLabel.exists && !topSwitch.exists &&
            !middleSwitch.exists && !lastSwitch.exists && !detailCell.exists && !tableFooter.exists {
            XCTFail("\(pageIdentifier) has not found!!!")
        }
    }
}

struct DefaultDetailScreen: DetailScreen {
    var pageIdentifier: XCUIElement {
        return XCUIApplication().otherElements["__PageName__Detailscreen"]
    }
    
    var titleLabel: XCUIElement {
        return pageIdentifier.navigationBars.staticTexts["Animated View Controller"]
    }
    
    var animatedImage: XCUIElement {
        return pageIdentifier.otherElements["__Detailscreen__imageView"]
    }
    
    func validate() {
        if !pageIdentifier.exists && !titleLabel.exists && !animatedImage.exists {
            XCTFail("\(pageIdentifier) has not found!!!")
        }
    }
}
