//
//  NetworkService.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation

class NetworkService: NetworkServiceType {
    
    // Fetch feeds from API
    func fetchFeeds(url: String, completion: @escaping (Result<[Feed], Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                debugPrint("Failed to fetch feeds with error: \(err)")
                completion(.failure(err))
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let feedWrapper = try decoder.decode(FeedWrapper.self, from: data)
                completion(.success(feedWrapper.feeds))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

