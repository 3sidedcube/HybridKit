//
//  UIViewController+SwiftUI.swift
//  HybridKit
//
//  Created by Ben Shutt on 02/03/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public extension UIViewController {

    /// Make a `UIHostingController` with the given SwiftUI `contentView`.
    ///
    /// - Parameters:
    ///   - contentView: `ContentView` SwiftUI view
    ///   - navigationController: `UINavigationController` container
    /// - Returns: `UIViewController`
    static func hosted<ContentView: View>(
        _ contentView: ContentView,
        in navigationController: UINavigationController? = nil
    ) -> UIViewController {
        // Make the HostingController to use as an environment variable.
        // The (wrapped) view controller property can not be set yet.
        let hostingController = HostingController()

        // Make the UIHostingController instance. Inject environment variables into
        // the SwiftUI view for the containing UIHostingController and UINavigationController.
        let viewController = UIHostingController(rootView: contentView
            .environment(\.hostingController, hostingController)
            .environment(\.navigationController, navigationController)
        )

        // Now the UIHostingController has been instantiated. Update the
        // environment variable
        hostingController.viewController = viewController

        // Return UIHostingController
        return viewController
    }
}

// MARK: - UINavigationController

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
}
