//
//  MapPresenter.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation

class MapPresenter {
    private weak var mapPresenterDelegate: MapPresenterDelegate?
    private var networkService: NetworkServiceType
    
    init (networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func setPresenterDelegate(mapPresenterDelegate: MapPresenterDelegate) {
        self.mapPresenterDelegate = mapPresenterDelegate
    }
    
    func fetchFeeds() {
        networkService.fetchFeeds(url: ApiEndpoints.feeds) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let feeds):
                // Convert to view models and update map
                let feedViewModels = feeds.map({return FeedViewModel(feed: $0)})
                self.mapPresenterDelegate?.updateFeedsOnMap(feedViewModels: feedViewModels)
                
            case .failure(let error):
                // Can display an error alert etc. Not included in simple scope of task
                debugPrint("Failed to fetch or decode feeds with error: \(error)")
            }
        }
    }
}
