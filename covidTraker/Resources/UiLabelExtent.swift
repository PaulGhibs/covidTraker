//
//  UiLabelExtent.swift
//  covidTraker
//
//  Created by Paul Ghb on 01/12/2021.
//

import Foundation
import UIKit


extension UILabel {
    func textDropShadow() {
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
    }

    static func createCustomLabel() -> UILabel {
        let label = UILabel()
        label.textDropShadow()
        return label
    }
}
