//
//  Category.swift
//  Yelp
//
//  Created by David Bowen on 2/16/15.
//

let categories = [
    Category(name: "Afghan", key: "afghani"),
    Category(name: "American", key: "newamerican,tradamerican"),
    Category(name: "Argentine", key: "argentine"),
    Category(name: "Asian Fusion", key: "asianfusion"),
    Category(name: "Barbecue", key: "bbq"),
    Category(name: "Bars", key: "bars"),
    Category(name: "Bistros", key: "bistros"),
    Category(name: "Brazilian", key: "brazilian"),
    Category(name: "Breakfast", key: "breakfast"),
    Category(name: "Burgers", key: "burgers"),
    Category(name: "Cafes", key: "cafes"),
    Category(name: "Caribbean", key: "caribbean"),
    Category(name: "Chilean", key: "chilean"),
    Category(name: "Chinese", key: "chinese"),
    Category(name: "Comfort Food", key: "comfortfood"),
    Category(name: "Ethiopian", key: "ethiopian"),
    Category(name: "Fish and Chips", key: "fishnchips"),
    Category(name: "French", key: "french"),
    Category(name: "German", key: "german"),
    Category(name: "Greek", key: "greek"),
    Category(name: "Hungarian", key: "hungarian"),
    Category(name: "Indian", key: "indian"),
    Category(name: "Indonesian", key: "indonesian"),
    Category(name: "Irish", key: "irish"),
    Category(name: "Italian", key: "italian"),
    Category(name: "Japanese", key: "japanese"),
    Category(name: "Kebab", key: "kebab"),
    Category(name: "Korean", key: "korean"),
    Category(name: "Kosher", key: "kosher"),
    Category(name: "Mediterranean", key: "mediterranean"),
    Category(name: "Mexican", key: "mexican"),
    Category(name: "Middle Eastern", key: "mideastern"),
    Category(name: "Moroccan", key: "moroccan"),
    Category(name: "Pakistani", key: "pakistani"),
    Category(name: "Persian/Iranian", key: "persian"),
    Category(name: "Pizza", key: "pizza"),
    Category(name: "Polish", key: "polish"),
    Category(name: "Salad", key: "salad"),
    Category(name: "Steakhouses", key: "steak"),
    Category(name: "Thai", key: "thai"),
    Category(name: "Vietnamese", key: "vietnamese"),
    Category(name: "Wraps", key: "wraps")
]


class Category: NSObject {
    
    var name: String
    var key: String
    
    init(name: String, key: String) {
        self.name = name
        self.key = key
    }
    
}
