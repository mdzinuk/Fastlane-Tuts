//
//  Fastlane_TutorialUITests.swift
//  Fastlane TutorialUITests
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//

import XCTest

class Fastlane_TutorialUITests: XCTestCase, UITestContext {
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app?.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        guard let app = app else { return }
        let mainScreen = app.mainScreen
        let detailScreen = app.detailScreen
        
        app.waitUntilToAppear(mainScreen.pageIdentifier, seconds: 5) { (isHomeScreen) in
            if isHomeScreen {
                //Home
                app.waitUntilToAppear(mainScreen.topSwitch)
                mainScreen.didSelectDisclosureIndecator(mainScreen.topSwitch)
                
                app.waitUntilToAppear(mainScreen.middleSwitch)
                mainScreen.didSelectDisclosureIndecator(mainScreen.middleSwitch)
                
                app.waitUntilToAppear(mainScreen.lastSwitch)
                mainScreen.didSelectDisclosureIndecator(mainScreen.lastSwitch)
                
                app.waitUntilToAppear(mainScreen.lastSwitch)
                mainScreen.didSelectDisclosureIndecator(mainScreen.lastSwitch)
                
                app.waitUntilToAppear(mainScreen.middleSwitch)
                mainScreen.didSelectDisclosureIndecator(mainScreen.middleSwitch)
                
                app.waitUntilToAppear(mainScreen.topSwitch)
                mainScreen.didSelectDisclosureIndecator(mainScreen.topSwitch)
                
                app.waitUntilToAppear(mainScreen.topSwitch)
                mainScreen.didSelectDisclosureIndecator(mainScreen.topSwitch)
                
                mainScreen.validate()
                
                app.waitUntilToAppear(mainScreen.detailCell)
                mainScreen.didSelectDisclosureIndecator(mainScreen.detailCell)
                
                //Detail
                app.waitUntilToAppear(detailScreen.pageIdentifier, seconds: 5) { (isDetailScreen) in
                    detailScreen.validate()
                }
            }
        }
    }
}

