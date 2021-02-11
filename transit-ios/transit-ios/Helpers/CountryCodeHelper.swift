//
//  CountryCodeHelper.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation
import UIKit

// Singleton class helper to get pin color by country code
class CountryCodeHelper {
    static let shared = CountryCodeHelper()
    
    private let pinColourHexByCountryCode: [String: String] = [CountryCodes.canada: MapPinColorHex.canada,
                                                               CountryCodes.unitedStates: MapPinColorHex.unitedStates,
                                                               CountryCodes.unitedKingdom: MapPinColorHex.unitedKingdom,
                                                               CountryCodes.france: MapPinColorHex.france,
                                                               CountryCodes.germany: MapPinColorHex.germany]
    
    func getColorByCountryCode(code: String) -> UIColor {
        if let hex = pinColourHexByCountryCode[code] {
            return UIColor.hexToColor(hex: hex)!
        } else {
            return UIColor.hexToColor(hex: MapPinColorHex.other)!
        }
    }
}
