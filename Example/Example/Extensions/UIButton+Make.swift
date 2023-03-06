//
//  UIButton+Make.swift
//  Example
//
//  Created by Ben Shutt on 06/03/2023.
//

import UIKit

extension UIButton {

    static func make(
        title: String,
        action: @escaping () -> Void
    ) -> UIButton {
        var configuration = UIButton.Configuration.plain()
        configuration.title = title
        return UIButton(
            configuration: configuration,
            primaryAction: .init { _ in
                action()
            }
        )
    }
}
