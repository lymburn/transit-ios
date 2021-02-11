//
//  NetworkServiceType.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation

protocol NetworkServiceType: class {
    func fetchFeeds(url: String, completion: @escaping (Result<[Feed], Error>) -> Void)
}
