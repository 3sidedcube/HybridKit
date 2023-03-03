# HybridKit

Bridging between UIKit and SwiftUI.

## Usage

In order for the environment variables to be set, create the `UIHostingController` using the static `hosted(_:in:)` method

```swift
let viewController: UIViewController = .hosted(SomeView())
```

optionally passing in a navigation controller

```swift
let viewController: UIViewController = .hosted(SomeView(), in: navigationController)
```

If `SomeView` conforms to `HostedView` it then has access to the containing `UIHostingController` and `UINavigationController` via `@Environment` variables.

## Environment Variables

A SwiftUI `View` may conform to `HostedView` in order to interface with its containing `UIHostingController` and `UINavigationController`.
These are passed as environment variables when the `UIHostingController` is instantiated.
With a reference to these view controllers, the SwiftUI can push, present, and dismiss the containing view controller.

For example:

```swift
struct ExampleScreen: HostedView {

    /// Access the the `UIHostingController`
    @Environment(\.hostingController) var hostingController

    /// Access the `UINavigationController` of the `UIHostingController`
    @Environment(\.navigationController) var navigationController

    ...
}
```

As a result of conforming to `HostedView` the SwiftUI `View` is able to do stuff like:

```swift
push(AnotherScreen()) // Push on navigation stack
```

## Caveats

* Unless the `@Environment` are specified, they default to `nil`. So ensure they are set in order to bridge with UIKit
* In `HostingController`, the `viewController` property is set *after* instantiating the SwiftUI view.

## Architecture and Data Flow

When developing navigation flows, be conscious that the SwiftUI `View`s are instantiated when the hosting `UIHostingController` is instantiated and pushed on the navigation stack. I.e. on a when-needed basis. This is a different way of thinking to pure SwiftUI where `NavigationLink` instantiates views all the way through the flow.
