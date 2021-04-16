//
//  NAIndicatorController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 16.04.21.
//

import UIKit

class IndicatorController: UIViewController {

    var displayLink: CADisplayLink!
    var loadingIndicator: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupIndicator()
        displayLink = CADisplayLink(target: self, selector: #selector(handleAnimations))
        displayLink.add(to: RunLoop.main, forMode: .default)
    }

    var value: CGFloat = 0.0
    var invert: Bool = false

    @objc fileprivate func handleAnimations() {
        invert ? (value -= 1) : (value += 1)
        loadingIndicator.backgroundColor = UIColor.orange.withAlphaComponent(value/100)
        if value > 100 || value < 0 {
            invert = !invert
        }
        print("")
    }

//    fileprivate func setupIndicator() {
//        view.addSubview(loadingIndicator)
//        loadingIndicator.layer.cornerRadius = 50
//        loadingIndicator.backgroundColor =  UIColor(named: "AccentColor")
//        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
//        loadingIndicator.centerYAnchor.
//        loadingIndicator
//        loadingIndicator
//        loadingIndicator
//    }
}
