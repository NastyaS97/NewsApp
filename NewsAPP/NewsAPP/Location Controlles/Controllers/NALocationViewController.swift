//
//  NALocationViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 13.04.21.
//

import UIKit

class NALocationViewController: UIViewController {

    //MARK: - variables

    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!

    //MARK: - load the information throught lofe cycle func

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?zip=94040,us&units=imperial&appid=714f89121c24133c60091ce6575bb2d0") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data,
                                                                      options: .mutableContainers) as? [String : Any] else { return }
                    guard let weatherDetails = json["weather"] as? [[String : Any]],
                          let weatherMain = json["main"] as? [String : Any] else { return }
                    let temp = Int(weatherMain["temp"] as? Double ?? 0)
                    let description = (weatherDetails.first?["description"] as? String)?.capitalizingFirstLetter()
                    DispatchQueue.main.async {
                        self.setWeather(weather: weatherDetails.first?["main"] as? String, description: description, temp: temp)
                    }
                } catch {
                    print("error")
                }
            }
        }
        task.resume()
    }

    //MARK: - action

    func setWeather(weather: String?, description: String?, temp: Int) {
        weatherDescription.text = description ?? "..."
        tempLabel.text = "\(temp)"
        switch weather {
        case "Sunny":
            weatherImage.image = UIImage(named: "Sunny")
            background.backgroundColor = UIColor(red: 0.97, green: 0.78, blue: 0.35, alpha: 1.0)
        case "Сlearsky":
            weatherImage.image = UIImage(named: "ClearSky")
            background.backgroundColor = UIColor(red: 0.97, green: 0.78, blue: 0.35, alpha: 1.0)
        default:
            weatherImage.image = UIImage(named: "Cloudy")
            background.backgroundColor = UIColor(red: 0.42, green: 0.55, blue: 0.71, alpha: 1.0)
        }
    }

    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        let text = "Please, chose what you want"
        guard let url = URL(string: "bbc.com") else { return }
        let activityController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)

        self.present(activityController, animated: true)
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
