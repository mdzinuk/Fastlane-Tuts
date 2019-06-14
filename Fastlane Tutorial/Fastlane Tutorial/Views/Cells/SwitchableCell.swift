//
//  SwitchableCell.swift
//  Fastlane Tutorial
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//


import UIKit

class SwitchableCell: UITableViewCell, ReusableViewNibLoading {
    @IBOutlet weak public var titleLabel: UILabel!
    @IBOutlet weak public var subTitleLabel: UILabel!
    @IBOutlet weak public var settingSwitch: UISwitch!

    weak public var delegate: FIAccordionSwitchCellDelegate?

    override public func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = UIColor(red: 87.0/255.0, green: 135.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        subTitleLabel.textColor = UIColor(red: 87.0/255.0, green: 135.0/255.0, blue: 83.0/255.0, alpha: 0.85)
        
        titleLabel.text = nil
        subTitleLabel.text = nil
        settingSwitch.accessibilityIdentifier = "setting_switch"
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with item: ExpandableItem, andDelegate: FIAccordionSwitchCellDelegate?) {
        settingSwitch.isOn = item.state == .expanded
        titleLabel.text = item.title
        subTitleLabel.text = item.subTitle
        delegate = andDelegate
    }

    @IBAction func didChangeSwitchValue(_ sender: UISwitch) {
        delegate?.didEnableSetup(forSelected: self, with: sender.isOn)
    }
}
