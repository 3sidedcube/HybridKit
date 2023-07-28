//
//  HostedView+UIKit.swift
//  HybridKit
//
//  Created by Ben Shutt on 05/03/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public extension HostedView {

    /// Shorthand to get the `viewController` of the `hostingController`
    var viewController: UIViewController? {
        hostingController?.viewController
    }

    /// Present the given `viewController`
    /// - Parameters:
    ///   - viewController: `UIViewController` to present
    ///   - animated: `Bool` animated, defaults to `true`
    func present(
        _ viewController: UIViewController,
        animated: Bool = true
    ) {
        hostingController?.viewController?.present(
            viewController,
            animated: animated
        )
    }

    /// Dismiss the view controller
    /// - Parameter animated: `Bool` animated, defaults to `true`
    func dismiss(animated: Bool = true) {
        hostingController?.viewController?.dismiss(animated: animated)
    }

    /// Push the given SwiftUI `contentView` on the navigation stack
    /// - Parameters:
    ///   - contentView: `ContentView` SwiftUI view
    ///   - animated: `Bool` animated, defaults to `true`
    func push<ContentView: View>(
        _ contentView: ContentView,
        animated: Bool = true
    ) {
        navigationController?.push(contentView, animated: animated)
    }

    /// Pop the view controller
    /// - Parameter animated: `Bool` animated, defaults to `true`
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }

    /// Pop to the root view controller
    /// - Parameter animated: `Bool` animated, defaults to `true`
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
}

// MARK: - UINavigationController + Extensions

public extension UINavigationController {

    /// Push the given SwiftUI `contentView` on the navigation stack.
    ///
    /// - Parameters:
    ///   - contentView: `ContentView` SwiftUI view
    ///   - animated: `Bool` animated, defaults to `true`
    func push<ContentView: View>(
        _ contentView: ContentView,
        animated: Bool = true
    ) {
        pushViewController(
            .hosted(contentView, in: self),
            animated: animated
        )
    }

    /// Initialize with SwiftUI `contentView`
    /// - Parameter contentView: `ContentView`
    convenience init<ContentView: View>(_ contentView: ContentView) {
        self.init(nibName: nil, bundle: nil)
        setViewControllers([
            .hosted(contentView, in: self)
        ], animated: false)
    }
}
