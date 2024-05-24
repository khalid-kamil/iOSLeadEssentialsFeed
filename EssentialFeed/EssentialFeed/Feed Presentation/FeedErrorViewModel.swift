//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Khalid Kamil on 21/05/2024.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
