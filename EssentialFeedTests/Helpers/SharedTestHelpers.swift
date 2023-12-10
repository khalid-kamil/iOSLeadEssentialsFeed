//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Khalid Kamil on 10/12/2023.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
