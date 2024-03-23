//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Khalid Kamil on 01/02/2024.
//

import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        location != nil
    }
}
