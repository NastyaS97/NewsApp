//
//  OneboardingViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 15.04.21.
//

import UIKit

class OneboardingController: UIViewController {

    // MARK: - variables

    var slides: [OnboardingSlide] = []

    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }

    // MARK: - gui variables

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.slides = [OnboardingSlide(title: "Instant Updates",
                                       description: "Quick News Delivery at Your Sofastep",
                                       image: UIImage(named: "breakingNews")),
                       OnboardingSlide(title: "Current Weather",
                                       description: "You Don't need to install an additional APP for this",
                                       image: UIImage(named: "onboardingWeather")),
                       OnboardingSlide(title: "News Programs",
                                       description: "Up-to-Dates News Shedules on The Most Popular Channels",
                                       image: UIImage(named: "tvProgram"))]
    }

    // MARK: - actions

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeTBC") as! UITabBarController // TODO Optional Binding

            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true)

        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath,
                                        at: .centeredHorizontally,
                                        animated: true)
        }
    }
}

// MARK: - extension

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
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

