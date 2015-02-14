//
//  ViewController.swift
//  Yelp
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var client: YelpClient!
    var businesses: [Business] = []
    
    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    let yelpConsumerKey = "01E6srx8wb-t6zH8krspgA"
    let yelpConsumerSecret = "IqA3_aT38mtI7xAXh_OmLmXdZ50"
    let yelpToken = "EUawIwgrIsEAyIyoXVGFTU-5mjj2OKZU"
    let yelpTokenSecret = "winmtEC5PhTikBtPe0zWzqQx_18"
    
    @IBOutlet weak var tableView: UITableView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println("JSON: " + response.description)
            let responseDictionary = response as NSDictionary
            let responseArray = responseDictionary["businesses"] as? NSArray
            self.businesses = Business.businesses(responseArray!)
            self.tableView.reloadData()
        }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
            println(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("rows in section: %d", businesses.count)
        return businesses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("businessCell") as BusinessCell
        let business = businesses[indexPath.row]
        cell.setBusiness(business, row: indexPath.row)
        NSLog("row=\(indexPath.row), name=\(business.name)")
        return cell
    }
    
}

