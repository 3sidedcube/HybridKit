# HybridKit

Bridging between UIKit and SwiftUI.

## Usage

* Create the `UIHostingController` using the static `hosted` method
* The SwiftUI `View` which is passed into that can now be a `HostedView` to give access to the `UIHostingController` and `UINavigationController` via `@Environment` variables

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

When developing navigation flows, be conscious that the SwiftUI `View`s are instantiated when the hosting `UIHostingController` is instantiated and pushed on the navigation stack. I.e. on a when-needed basis. This is a different way of thinking to pure SwiftUI where `NavigationLink` instantiates views all the way through the flow.
