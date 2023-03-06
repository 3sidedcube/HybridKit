//
//  RootNavigationController.swift
//  Example
//
//  Created by Ben Shutt on 06/03/2023.
//

import UIKit

class RootNavigationController: UINavigationController {

    init() {
        super.init(nibName: nil, bundle: nil)
        setViewControllers([RootViewController()], animated: false)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
