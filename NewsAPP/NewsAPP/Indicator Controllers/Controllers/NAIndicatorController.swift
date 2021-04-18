//
//  NAIndicatorController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 16.04.21.
//

import UIKit
import TransitionButton

class IndicatorController: UIViewController {

    // MARK: - variablea

    let button = TransitionButton(frame: CGRect(x: 0, y: 250, width: 250, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        button.center = view.center
        button.backgroundColor = UIColor(named: "UniversalColor")
        button.setTitle("Let's start", for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        button.spinnerColor = .white

        view.addSubview(button)
    }

    // MARK: - actions with tapped button

    @objc func didTapButton() {
        button.startAnimation()

        DispatchQueue.main.asyncAfter(deadline: .now()+4) {
            self.button.stopAnimation(animationStyle: .expand, revertAfterDelay: 1) {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    let controller = self.storyboard?.instantiateViewController(identifier: "OnboardingVC") // TODO Optional Binding

//                    controller?.modalPresentationStyle = .fullScreen
//                    controller?.modalTransitionStyle = .flipHorizontal
                    self.present(controller!, animated: true)

                }
            }
        }
    }
}
