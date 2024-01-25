//
//  FeedViewController.swift
//  EssentialFeediOS
//
//  Created by Khalid Kamil on 25/01/2024.
//

import EssentialFeed
import UIKit

final public class FeedViewController: UITableViewController {
    private var viewAppeared = false

    private var loader: FeedLoader?

    public convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)
        load()
    }

    public override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)

        if !viewAppeared {
            load()
            viewAppeared = true
        }

    }

    @objc private func load() {
        refreshControl?.beginRefreshing()

        loader?.load { [weak self] _ in
            self?.refreshControl?.endRefreshing()
        }
    }
}
