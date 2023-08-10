//
//  FeedLoader.swift
//  Singleton
//
//  Created by Khalid Kamil on 09/06/2023.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

extension LoadFeedResult: Equatable where Error: Equatable { }

protocol FeedLoader {
  associatedtype Error: Swift.Error
  func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
