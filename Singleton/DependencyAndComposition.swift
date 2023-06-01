//
//  DependencyAndComposition.swift
//  Singleton
//
//  Created by Khalid Kamil on 01/06/2023.
//

import Foundation
import UIKit

protocol FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void)
}

class FeedViewController2: UIViewController {
    var loader: FeedLoader!
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadFeed { loadedItems in
            // Update UI
        }
    }
}

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // do something
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // do something
    }
}

struct Reachability {
    static let networkAvailable = false
}

// Imagine we are tasked with making the feed load remotely, and if not available then load locally.
// Create the logic a new type (service) instead of in the view controller
// Since the view controller expects a FeedLoader, make this class conform to that protocol
// So every class remains isolated
class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    let remote: RemoteFeedLoader
    let local: LocalFeedLoader
    
    init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        let load = Reachability.networkAvailable ? remote.loadFeed : local.loadFeed
        load(completion)
//        The above two lines can also be written like this
//        if Reachability.networkAvailable {
//            remote.loadFeed { loadedItems in
//                // do something
//            }
//        } else {
//            local.loadFeed { loadedItems in
//                // do something
//            }
//        }
    }
}

// Instantiation Example (initialisation injection)
let vc = FeedViewController2(loader: RemoteFeedLoader())
let vc2 = FeedViewController2(loader: LocalFeedLoader())
// Instantiation Example (property injection - good example for when the vc is initialised in storyboard)
let vc3 = FeedViewController2()
vc3.loader = RemoteWithLocalFallbackFeedLoader(remote: RemoteFeedLoader(), local: LocalFeedLoader())
