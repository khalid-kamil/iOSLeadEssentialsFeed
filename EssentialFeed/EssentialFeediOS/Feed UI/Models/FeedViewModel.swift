//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Khalid Kamil on 01/02/2024.
//

import EssentialFeed

final class FeedViewModel {
    typealias Observer<T> = (T) -> Void
    private let feedLoader: FeedLoader

    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    var onFeedLoad: (([FeedImage]) -> Void)?
    var onLoadingStateChange: Observer<Bool>?

    func loadFeed() {
        onLoadingStateChange?(true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.onLoadingStateChange?(false)
        }
    }
}
