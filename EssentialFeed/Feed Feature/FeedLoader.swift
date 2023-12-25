//
//  FeedLoader.swift
//  Singleton
//
//  Created by Khalid Kamil on 09/06/2023.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>

    func load(completion: @escaping (Result) -> Void)
}
