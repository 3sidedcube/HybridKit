//
//  RootViewController.swift
//  Example
//
//  Created by Ben Shutt on 06/03/2023.
//

import UIKit

class RootViewController: UIViewController {

    private let vStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()

    private let label = {
        let label = UILabel()
        label.text = "\(RootViewController.self)"
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()

    private lazy var pushUIKitButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Push UIKit ViewController"
        return UIButton(
            configuration: configuration,
            primaryAction: .init { [weak self] _ in
                self?.pushUIKitViewController()
            }
        )
    }()

    private lazy var pushSwiftUIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Push SwiftUI ViewController"
        return UIButton(
            configuration: configuration,
            primaryAction: .init { [weak self] _ in
                self?.pushSwiftUIViewController()
            }
        )
    }()

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
        vStackView.setCustomSpacing(8, after: pushUIKitButton)
    }

    // MARK: - Actions

    private func pushUIKitViewController() {
        navigationController?.pushViewController(
            ViewController(),
            animated: true
        )
    }

    private func pushSwiftUIViewController() {
        navigationController?.push(ScreenView())
    }
}
