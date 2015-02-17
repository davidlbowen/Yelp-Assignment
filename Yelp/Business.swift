//
//  Business.swift
//  Yelp
//
//  Created by David Bowen on 2/9/15.
//

class Business: NSObject {
   
    let milesPerMeter: Double = 0.000621371
    
    var imageUrl: NSURL?
    var ratingImageUrl: NSURL?
    var name: String?
    var numReviews: Int?
    var distInMiles: Double?
    var address: String?
    var categoryNames: [String] = []
    
    
    init(business: NSDictionary){
        super.init()
        
        if let imageUrlString = business.valueForKey("image_url") as? String {
            self.imageUrl = NSURL(string: imageUrlString)
        }
        
        var ratingImageUrlString = business.valueForKey("rating_img_url_small") as String
        self.ratingImageUrl = NSURL(string: ratingImageUrlString)
        
        self.name = business.valueForKey("name") as? String
        self.numReviews = business.valueForKeyPath("review_count") as? Int
        
        var distInMeters = business.valueForKeyPath("distance")! as Double
        self.distInMiles = distInMeters * milesPerMeter
        
        var streets = business.valueForKeyPath("location.address") as? [String] ?? [""]
        var street = streets.isEmpty ? "" : streets[0]
        
        var neighborhoods = (business.valueForKeyPath("location.neighborhoods")) as? [String] ?? [""]
        var neighborhood = neighborhoods.isEmpty ? "" : neighborhoods[0]

        self.address = "\(street), \(neighborhood)"

        for cat in business.valueForKey("categories") as [[String]] {
            self.categoryNames.append(cat[0])
        }
        
    }
    
    class func businesses(responseBusinesses: NSArray) -> [Business] {
        var result: [Business] = []
        for rb in responseBusinesses {
            result.append(Business(business: rb as NSDictionary))
        }
        return result
    }
    
}
