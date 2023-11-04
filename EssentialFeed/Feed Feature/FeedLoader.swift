//
//  FeedLoader.swift
//  Singleton
//
//  Created by Khalid Kamil on 09/06/2023.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
  func load(completion: @escaping (LoadFeedResult) -> Void)
}
