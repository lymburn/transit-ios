//
//  MapPresenterDelegate.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation

protocol MapPresenterDelegate: class {
    func updateFeedsOnMap(feedViewModels: [FeedViewModel])
}
