//
//  UIStackView+Make.swift
//  Example
//
//  Created by Ben Shutt on 06/03/2023.
//

import UIKit

extension UIStackView {

    static func make(
        axis: NSLayoutConstraint.Axis = .vertical,
        spacing: CGFloat = 0
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = spacing
        return stackView
    }
}
