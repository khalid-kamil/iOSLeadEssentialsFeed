//
//  FakeRefreshControl.swift
//  EssentialFeediOSTests
//
//  Created by Khalid Kamil on 31/01/2024.
//

import UIKit

class FakeRefreshControl: UIRefreshControl {
    private var _isRefreshing = false
    override var isRefreshing: Bool { _isRefreshing }

    override func beginRefreshing() {
        _isRefreshing = true
    }

    override func endRefreshing() {
        _isRefreshing = false
    }

}
