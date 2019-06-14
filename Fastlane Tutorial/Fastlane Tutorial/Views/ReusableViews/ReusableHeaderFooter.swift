//
//  ReusableHeaderFooter.swift
//
//  ReusableHeaderFooter.swift
//  Fastlane Tutorial
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//

import UIKit

public class ReusableHeaderFooter: UIView, TableViewHeaderFooterViewResizing {
    
    private weak var textLabel: UILabel!
    
    public init(text: String) {
        super.init(frame: .zero)
        prepareAutoresizingMask()
        setUp(with: text)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private struct Layout {
        static let verticalInset: CGFloat = 13
        static let horizontalInset: CGFloat = 16
    }
    
    private func setUp(with text: String) {
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 0
        textLabel.text = text
        textLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .heavy)
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor(red: 87.0/255.0, green: 135.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.verticalInset),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.verticalInset),
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.horizontalInset),
            textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.horizontalInset)
            ])
        
        self.textLabel = textLabel
        self.accessibilityIdentifier = "table_footer"
    }
}
