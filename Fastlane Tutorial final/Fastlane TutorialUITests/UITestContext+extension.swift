//
//  File.swift
//  Fastlane TutorialUITests
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//


import XCTest

extension XCUIApplication {
    var mainScreen: MainScreen {
        return DefaultMainScreen()
    }
    
    var detailScreen: DetailScreen {
        return DefaultDetailScreen()
    }
    
    func waitUntilToAppear(_ element: XCUIElement, seconds: TimeInterval = 20.0, handler: ((Bool) -> Void)? = nil) {
        var hasElement = false
        if showedUp(element: element, within: seconds) {
            print("\(element.identifier)" + "===" + "\(element.exists)")
            hasElement = true
        } else {
            print(hasElement)
            hasElement = false
        }
        handler?(hasElement)
    }
    
    private func showedUp(element: XCUIElement, within limit: Double = 20.0) -> Bool {
        return wait(for: { element.exists }, timeout: limit)
    }
    
    private func wait(for cond: () -> Bool, timeout: Double) -> Bool {
        let start = Date()
        func timedout() -> Bool {
            return (start.timeIntervalSinceNow + timeout) < 0
        }
        
        while !timedout() {
            if cond() { return true }
            usleep(500_000)
        }
        return false
    }
}

extension UITestContext {
    var app: XCUIApplication? {
        let app = XCUIApplication()
        app.launchArguments.append("-Fastlane_TutorialUITests")
        return app
    }
    
    func rotateToPortrait() {
        XCUIDevice().orientation = UIDeviceOrientation.portrait
    }
    
    func isIpad() -> Bool {
        return UI_USER_INTERFACE_IDIOM() == .pad
    }
}
