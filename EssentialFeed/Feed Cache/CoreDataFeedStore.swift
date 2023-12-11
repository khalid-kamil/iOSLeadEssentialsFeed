//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Khalid Kamil on 11/12/2023.
//

import Foundation

public final class CoreDataFeedStore: FeedStore {
    public init() {}
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {

    }

    public func insert(_ feed: [EssentialFeed.LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {

    }

    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }

}
