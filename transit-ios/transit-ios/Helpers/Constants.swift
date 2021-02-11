//
//  Constants.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation

struct CountryCodes {
    static let canada = "CA"
    static let unitedStates = "US"
    static let france = "FR"
    static let unitedKingdom = "GB" // Note seems there's one Manchester entry with "UK" but rest "GB"
    static let germany = "DE"
}

struct ImageNames {
    static let pin = "pin"
}

struct MapPinColorHex {
    static let canada = "#F44336"
    static let unitedStates = "#E040FB"
    static let france = "#3F51B5"
    static let unitedKingdom = "#8BC34A"
    static let germany = "#FFC107"
    static let other = "#00BCD4"
}

struct ApiEndpoints {
    static let feeds = "https://api.transitapp.com/v3/feeds?detailed=1"
}
