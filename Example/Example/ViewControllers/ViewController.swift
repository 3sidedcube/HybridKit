//
//  ViewController.swift
//  Example
//
//  Created by Ben Shutt on 06/03/2023.
//

import UIKit

/// A UIKit view controller
class ViewController: UIViewController {

    private let colorView = {
        let view = UIView()
        view.backgroundColor = .blue.withAlphaComponent(0.2)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(colorView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colorView.frame = view.bounds
    }
}
