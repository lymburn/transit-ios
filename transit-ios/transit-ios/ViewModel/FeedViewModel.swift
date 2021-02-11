//
//  FeedViewModel.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation
import UIKit
import MapKit

struct FeedViewModel {
    let name: String
    let city: String
    let pinColor: UIColor
    let latitude: Double
    let longitude: Double
    
    init(feed: Feed) {
        self.name = feed.name
        self.city = feed.location

        let countryCode = feed.countryCode
        self.pinColor = CountryCodeHelper.shared.getColorByCountryCode(code: countryCode)
        
        let feedBounds = feed.bounds
        
        // Set lat and lon to center of bounds
        self.latitude = feedBounds.maxLat - (feedBounds.maxLat - feedBounds.minLat)/2.0
        self.longitude = feedBounds.maxLon - (feedBounds.maxLon - feedBounds.minLon)/2.0
    }
}
