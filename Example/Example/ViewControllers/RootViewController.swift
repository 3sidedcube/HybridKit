//
//  RootViewController.swift
//  Example
//
//  Created by Ben Shutt on 06/03/2023.
//

import UIKit

class RootViewController: UIViewController {

    private let vStackView: UIStackView = .make(spacing: 8)

    private let label: UILabel = .make(text: "Pick An Action")

    private lazy var pushUIKitButton: UIButton = .make(
        title: "Push UIKit ViewController"
    ) { [weak self] in
        self?.navigationController?.pushViewController(
            ViewController(),
            animated: true
        )
    }

    private lazy var pushSwiftUIButton: UIButton = .make(
        title: "Push SwiftUI ViewController"
    ) { [weak self] in
        self?.navigationController?.push(PushedView())
    }

    private lazy var presentSwiftUIButton: UIButton = .make(
        title: "Present SwiftUI ViewController"
    ) { [weak self] in
        self?.navigationController?.present(
            UINavigationController(PresentedView()),
            animated: true
        )
    }

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviewsAndConstraints()
    }

    // MARK: - Subviews and Constraints

    private func addSubviewsAndConstraints() {
        view.addSubview(vStackView)
        vStackView.addArrangedSubview(label)
        vStackView.addArrangedSubview(pushUIKitButton)
        vStackView.addArrangedSubview(pushSwiftUIButton)
        vStackView.addArrangedSubview(presentSwiftUIButton)

        vStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStackView.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.8
            )
        ])

        vStackView.setCustomSpacing(20, after: label)
    }
}
