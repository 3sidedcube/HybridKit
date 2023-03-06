//
//  PresentedView.swift
//  Example
//
//  Created by Ben Shutt on 06/03/2023.
//

import SwiftUI
import HybridKit

struct PresentedView: HostedView {

    /// Access the the `UIHostingController`
    @Environment(\.hostingController) var hostingController

    /// Access the `UINavigationController` of the `UIHostingController`
    @Environment(\.navigationController) var navigationController

    var body: some View {
        VStack {
            Button("Push") {
                push(PushedView()) // From HostedView
            }
        }
    }
}
