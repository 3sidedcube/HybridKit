//
//  NavigationControllerKey.swift
//  HybridKit
//
//  Created by Ben Shutt on 02/03/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// `EnvironmentKey` to access the containing `UINavigationController`
public struct NavigationControllerKey: EnvironmentKey {

    /// The `UINavigationController` instance
    public static let defaultValue: UINavigationController? = nil
}

public extension EnvironmentValues {

    /// Get and set `UINavigationController` for `NavigationControllerKey`
    var navigationController: UINavigationController? {
        get { self[NavigationControllerKey.self] }
        set { self[NavigationControllerKey.self] = newValue }
    }
}
