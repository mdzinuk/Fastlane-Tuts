//
//  Models.swift
//  Fastlane Tutorial
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//

import Foundation

struct ExpandableModel: ExpandableItem {
    var state: ExpandableState
    var childContainer: [Any]
    
    var title: String {
        return "Expandable Cell"
    }
    
    var subTitle: String? {
        return "Expandable Cell always represent with Switch element, not necessarily it allows expansion."
    }
    
    init(state: ExpandableState, childrens: [Any]) {
        self.state = state
        childContainer = childrens
    }
    
    var rowCounts: Int {
        return (self.state == .expanded) ? childContainer.count + 1 : 1
    }
}

struct NonExpandableModel: ExpandableItem {
    var title: String
    var subTitle: String?
    
    var state: ExpandableState
    var childContainer: [Any]
    
    var rowCounts: Int {
        return childContainer.count
    }
    
    init(tittle: String, subtitle: String?, state: ExpandableState) {
        self.title = tittle
        self.subTitle = subtitle
        self.state = state
        self.childContainer = []
    }
}
