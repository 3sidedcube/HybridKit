//
//  UILabel+Make.swift
//  Example
//
//  Created by Ben Shutt on 06/03/2023.
//

import UIKit

extension UILabel {

    static func make(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }
}
