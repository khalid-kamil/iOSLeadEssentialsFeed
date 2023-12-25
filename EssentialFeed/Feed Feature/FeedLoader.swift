//
//  FeedLoader.swift
//  Singleton
//
//  Created by Khalid Kamil on 09/06/2023.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
  func load(completion: @escaping (LoadFeedResult) -> Void)
}
