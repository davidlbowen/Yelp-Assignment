//
//  FilterCell.swift
//  Yelp
//
//  Created by David Bowen on 2/16/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

protocol FilterCellDelegate: class {
    func filterCell(filterCell: FilterCell, didChangeValue value: Bool)
}

class FilterCell: UITableViewCell {

    @IBOutlet weak var filterSwitch: UISwitch!
    @IBOutlet weak var filterLabel: UILabel!
    weak var delegate: FilterCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        filterSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
        filterSwitch.on = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func switchValueChanged() {
        delegate?.filterCell(self, didChangeValue: filterSwitch.on)
    }

}
