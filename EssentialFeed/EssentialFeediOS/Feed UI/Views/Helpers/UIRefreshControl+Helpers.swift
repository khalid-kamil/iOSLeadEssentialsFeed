//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Khalid Kamil on 20/04/2024.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
