//
//  NAWeatherController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 21.04.21.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation

class NAWeatherController: UIViewController {

    //MARK: - variables

    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var currentDay: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        background.layer.addSublayer(gradientLayer)
    }

    override func viewDidAppear(_ animated: Bool) {
        setDarkGradient()
    }

    func setDarkGradient() {
        let topGradient = UIColor(red: 255 / 255, green: 124 / 255, blue: 98 / 255, alpha: 1).cgColor
        let secondGradient = UIColor.white.cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topGradient, secondGradient]
    }

    func setLightGradient() {
        let topGradient = UIColor(red: 0.42, green: 0.55, blue: 0.71, alpha: 1.0).cgColor
        let secondGradient = UIColor.white.cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topGradient, secondGradient]
    }

}
