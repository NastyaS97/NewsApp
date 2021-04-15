//
//  OneboardingViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 15.04.21.
//

import UIKit

class OneboardingController: UIViewController {

    // MARK: - variables

    var weather = UIImage(contentsOfFile: "weather")
    var tvProgram = UIImage(contentsOfFile: "tvProgram")
    var breakingNews = UIImage(contentsOfFile: "breakingNews")

    var slides: [OnboardingSlide] = []

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        slides = [
            OnboardingSlide(title: "Instant Updates", description: "Quick News Delivery at Your Sofastep", image: breakingNews!),
            OnboardingSlide(title: "Current Weather", description: "You Don't need to install an additional APP for this", image: weather!),
            OnboardingSlide(title: "News Programs", description: "Up-to-Dates News Shedules on The Most Popular Channels", image: tvProgram!)
            ]
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {

    }
}

extension OneboardingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingViewCell.reuseIdentifier,
                                                            for: indexPath) as? OnboardingViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(slides[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

}

