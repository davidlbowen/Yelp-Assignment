//
//  BusinessCell.swift
//  Yelp
//
//  Created by David Bowen on 2/14/15.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var numReviews: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var categories: UILabel!
    @IBOutlet weak var dollars: UILabel!
    
    func setBusiness(business: Business, row: Int) {
        name.text = NSString(format: "%d. %@", row + 1, business.name!)
        distance.text = NSString(format: "%0.2f mi", business.distInMiles!)
        numReviews.text = NSString(format: "%ld reviews", business.numReviews!)
        address.text = business.address
        categories.text = ", ".join(business.categoryNames)
        dollars.text = "$$" // TODO
        
        if let imageUrl = business.imageUrl {
            businessImageView.setImageWithURL(imageUrl)
        } else {
            // set a default image?
        }
        
        ratingImageView.setImageWithURL(business.ratingImageUrl!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
