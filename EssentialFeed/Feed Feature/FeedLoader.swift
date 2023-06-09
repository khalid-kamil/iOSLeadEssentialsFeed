//
//  FeedLoader.swift
//  Singleton
//
//  Created by Khalid Kamil on 09/06/2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
