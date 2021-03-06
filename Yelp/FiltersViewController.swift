//
//  FiltersViewController.swift
//  Yelp
//
//  Created by David Bowen on 2/14/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate : class {
    func filtersViewController(viewController: FiltersViewController, didSetFilters filters: [Int : Bool])
}


class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FilterCellDelegate {

    @IBOutlet weak var filtersTableView: UITableView!
    weak var delegate: FiltersViewControllerDelegate?
    var filterValues = [Int : Bool]()
    let sectionHeaders = ["Sort by", "General Features"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtersTableView.delegate = self
        filtersTableView.dataSource = self
        filtersTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : categories.count
    }

    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onApply(sender: AnyObject) {
        delegate?.filtersViewController(self, didSetFilters: filterValues)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("sortCell") as SortTableViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("filterCell") as FilterCell;
            cell.filterLabel.text = categories[indexPath.row].name
            cell.delegate = self
            cell.filterSwitch.on = filterValues[indexPath.row] ?? false
            NSLog("#### Row \(indexPath.row), \(cell.filterLabel.text!) is on: \(cell.filterSwitch.on)")
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        NSLog("didSelectRowAtIndexPath: \(indexPath.row)")
    }
    
    func filterCell(filterCell: FilterCell, didChangeValue value: Bool) {
        let indexPath = filtersTableView.indexPathForCell(filterCell)!
        filterValues[indexPath.row] = value
        NSLog("filterCell[\(indexPath.row)] = \(value)")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
