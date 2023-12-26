//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Khalid Kamil on 04/11/2023.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
