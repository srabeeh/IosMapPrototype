//
//  Beer.swift
//  MapkitPrototype
//
//  Created by Sam Rabeeh on 2016-09-20.
//  Copyright © 2016 Sam Rabeeh - RCI. All rights reserved.
//

import UIKit

class Beer {
    
    init(breweryName: String, beerType: String, beerPour: BEER_TYPES, latitude: Decimal, longitude: Decimal, barName: String, barOpenStatus: Bool, rating: Int?) {
        
        BreweryName = breweryName
        BeerType = beerType
        BeerPour = beerPour
        Latitude = latitude
        Longtitude = longitude
        BarName = barName
        BarOpenStatus = barOpenStatus
        Rating = rating!
    }
    
    init(){
        BreweryName = "Init"
        BeerType = "Pilsner"
        BeerPour = BEER_TYPES.Bottle
        Latitude = -77.3036
        Longtitude = 35.999
        BarName = "Sammy's"
        BarOpenStatus = true
        Rating = 2
    }
    
    var BreweryName: String
    var BeerType: String
    var BeerPour: BEER_TYPES
    var Latitude: Decimal
    var Longtitude: Decimal
    var BarName: String
    var BarOpenStatus: Bool
    var Rating: Int
    
    
    
}
