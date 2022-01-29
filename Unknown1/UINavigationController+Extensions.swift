//
//  UINavigationController+Extensions.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import UIKit
import SwiftUI

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
