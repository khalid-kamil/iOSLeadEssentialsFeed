//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Khalid Kamil on 04/04/2024.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
