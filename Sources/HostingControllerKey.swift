//
//  HostingControllerKey.swift
//  HybridKit
//
//  Created by Ben Shutt on 02/03/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// Wrapper of a weakly referenced `UIViewController`.
///
/// - Note:
/// For `UIHostingController`s, the `viewController` property is set
/// *after* instantiating the SwiftUI view.
public final class HostingController {

    /// Wrapped `UIViewController`
    public weak var viewController: UIViewController?

    /// Memberwise initializer
    /// - Parameter viewController: `UIViewController`
    public init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

/// `EnvironmentKey` to access the containing `UIViewController`
public struct HostingControllerKey: EnvironmentKey {

    /// The `HostingController` instance
    public static let defaultValue: HostingController? = nil
}

public extension EnvironmentValues {

    /// Get and set `UIViewController` for `HostingControllerKey`
    var hostingController: HostingController? {
        get { self[HostingControllerKey.self] }
        set { self[HostingControllerKey.self] = newValue }
    }
}
