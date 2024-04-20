//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Khalid Kamil on 20/04/2024.
//

import EssentialFeed

struct FeedErrorViewModel {
    let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
