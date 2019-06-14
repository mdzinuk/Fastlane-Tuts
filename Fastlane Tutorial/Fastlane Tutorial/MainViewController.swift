//
//  MainViewController.swift
//  Fastlane Tutorial
//
//  Created by Mohammad Arafat Hossain on 6/14/19.
//  Copyright © 2019 M. Arafat. All rights reserved.
//

import UIKit

class MainViewController: AnimatedViewController {
    @IBOutlet weak var table: UITableView! { didSet { self.tableView = table } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.register(SwitchableCell.nib,
                            forCellReuseIdentifier: SwitchableCell.reuseIdentifier)
        
        tableView?.register(SimpleCell.nib,
                            forCellReuseIdentifier: SimpleCell.reuseIdentifier)
        tableView?.dataSource = self
        tableView?.delegate = self
        
        let model1 = ExpandableModel(state: .collapsed,
                                     childrens: ["Group", "Expandable cell number 01",
                                                 NonExpandableModel(tittle: "Expendable cell, but here it's non-expandable cell",
                                                                    subtitle: "Is not necessary to expand, that we mentioned in group cell. So, it is non expandable cell.",
                                                                    state: .collapsed)])
        
        
        let model2 = ExpandableModel(state: .collapsed,
                                     childrens: ["This is Another usual child.", "Hey Non expandable."])
        
        dataSource = [model1, model2]
        total = model1.rowCounts + model2.rowCounts
        
        addTableFooter(text: "This is Table Footer")
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    var tableFooterView: ReusableHeaderFooter? {
        return tableView?.tableFooterView as? ReusableHeaderFooter
    }
    
    var tableHeaderView: ReusableHeaderFooter? {
        return tableView?.tableHeaderView as? ReusableHeaderFooter
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableHeaderView?.updateLayout(with: tableView?.bounds.width ?? 0)
        tableFooterView?.updateLayout(with: tableView?.bounds.width ?? 0)
    }
    
    func addTableFooter(text: String) {
        let footerView = ReusableHeaderFooter(text: text)
        tableView?.tableFooterView = footerView
    }
    
    func addTableHeader(text: String) {
        let footerView = ReusableHeaderFooter(text: text)
        tableView?.tableHeaderView = footerView
    }
}


// AccordionSwitchCell
extension MainViewController: FIAccordionSwitchCellDelegate {
    func didEnableSetup(forSelected groupCell: UITableViewCell, with selectionState: Bool) {
        guard let indexPath = tableView?.indexPath(for: groupCell) else {
            return
        }
        
        let (groupId, isGroupCell, _) = findGroup(indexPath.row)
        
        guard isGroupCell else {
            return
        }
        
        tableView?.beginUpdates()
        updateCells(groupId, index: indexPath.row)
        tableView?.endUpdates()
    }
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var resourceCell = UITableViewCell()
        
        let (groupId, isGroupCell, actualPosition) = findGroup(indexPath.row)
        guard isGroupCell else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SwitchableCell.reuseIdentifier,
                                                        for: indexPath) as? SwitchableCell {
                //cell.configure(with: dataSource[groupId].childContainer[indexPath.row - actualPosition - 1] as! String, andDelegate: nil)
                if let ss = dataSource[groupId].childContainer[indexPath.row - actualPosition - 1] as? ExpandableItem {
                    cell.configure(with: ss, andDelegate: self)
                }
                resourceCell = cell
            }
            
            if let ss = dataSource[groupId].childContainer[indexPath.row - actualPosition - 1] as? String {
                
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: SimpleCell.reuseIdentifier,
                                                            for: indexPath) as? SimpleCell {
                    cell.configure(ss, "So, this general cell does not have any sub title but we're adding it here manually.")
                    resourceCell = cell
                }
            }
            return resourceCell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: SwitchableCell.reuseIdentifier,
                                                    for: indexPath) as? SwitchableCell {
            cell.configure(with: dataSource[groupId], andDelegate: self)
            resourceCell = cell
        }
        return resourceCell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let (_, isGroupCell, _) = findGroup(indexPath.row)
        guard !isGroupCell else {
            return
        }
        self.performSegue(withIdentifier: DetailViewController.seagueIdntifer, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // If we don't return anything then the last cell seperator will gone
        return 1.0
    }
}

