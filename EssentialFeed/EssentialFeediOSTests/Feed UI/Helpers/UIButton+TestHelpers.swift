//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Khalid Kamil on 31/01/2024.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
