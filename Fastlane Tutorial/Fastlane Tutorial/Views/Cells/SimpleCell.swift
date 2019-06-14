//
//  SimpleCell.swift
//  Fastlane Tutorial
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//

import UIKit

class SimpleCell: UITableViewCell, ReusableViewNibLoading {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = UIColor(red: 87.0/255.0, green: 135.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        subtitleLabel.textColor = UIColor(red: 87.0/255.0, green: 135.0/255.0, blue: 83.0/255.0, alpha: 0.85)
        
        titleLabel.text = nil
        subtitleLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ title: String, _ subtitle: String? = nil) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
