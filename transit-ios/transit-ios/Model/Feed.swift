//
//  Feed.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation

struct Feed: Decodable {
    let name: String
    let bounds: Bounds
    let location: String
    let countryCode: String
}
 
