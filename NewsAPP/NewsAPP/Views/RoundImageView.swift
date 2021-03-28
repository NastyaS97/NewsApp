//
//  RoundImageView.swift
//  NewsAPP
//
//  Created by Настя Сойко on 28.03.21.
//

import UIKit

@IBDesignable
class RoundedImagView: UIImageView {

    // MARK: - IBInspectable
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var clipsToBounds2: Bool {
        set {
            self.clipsToBounds = true
        }
        get {
            return self.clipsToBounds
        }
    }
}
