//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Khalid Kamil on 01/02/2024.
//

import EssentialFeed

final class FeedViewModel {
    private let feedLoader: FeedLoader

    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    var onFeedLoad: (([FeedImage]) -> Void)?
    var onChange: ((FeedViewModel) -> Void)?

    private(set) var isLoading: Bool = false {
        didSet { onChange?(self)}
    }

    func loadFeed() {
        isLoading = true
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.isLoading = false
        }
    }
}
