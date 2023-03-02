//
//  HostedView.swift
//  HybridKit
//
//  Created by Ben Shutt on 02/03/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// A SwiftUI `View` that is the root of a `UIHostingController`
public protocol HostedView: View {

    /// Get the hosted `UIViewController`
    var hostingController: HostingController? { get }

    /// Get the container `UINavigationController`
    var navigationController: UINavigationController? { get }
}

public extension HostedView {

    /// By default, return `nil`
    var hostingController: HostingController? {
        nil
    }

    /// By default, return `nil`
    var navigationController: UINavigationController? {
        nil
    }
}
