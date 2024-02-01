//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Khalid Kamil on 31/01/2024.
//

import UIKit

public final class FeedRefreshViewController: NSObject {
    public lazy var view: UIRefreshControl = binded(UIRefreshControl())

    private let viewModel: FeedViewModel

    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }

    func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onChange = { [weak self] viewModel in
            if viewModel.isLoading {
                self?.view.beginRefreshing()
            } else {
                self?.view.endRefreshing()
            }
        }
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }

    @objc func refresh() {
        viewModel.loadFeed()
    }
}
