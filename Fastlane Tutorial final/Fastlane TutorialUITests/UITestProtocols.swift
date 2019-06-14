//
//  File.swift
//  Fastlane TutorialUITests
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//

import XCTest

protocol UITestContext {
    var app: XCUIApplication? { get }
    func rotateToPortrait()
    func isIpad() -> Bool
}
protocol PageIdentifier {
    var pageIdentifier: XCUIElement { get }
    var titleLabel: XCUIElement { get }
    func validate()
}
protocol MainScreen: PageIdentifier {
    var pageIdentifier: XCUIElement { get }
    var titleLabel: XCUIElement { get }
    var topSwitch: XCUIElement { get }
    var middleSwitch: XCUIElement { get }
    var lastSwitch: XCUIElement { get }
    var tableFooter: XCUIElement { get }
    var detailCell: XCUIElement { get }
    func didSelectDisclosureIndecator(_ element: XCUIElement)
}
protocol DetailScreen: PageIdentifier {
    var pageIdentifier: XCUIElement { get }
    var titleLabel: XCUIElement { get }
    var animatedImage: XCUIElement { get }
}
