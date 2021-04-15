//
//  NAOnboardingViewCell.swift
//  NewsAPP
//
//  Created by Настя Сойко on 15.04.21.
//

import UIKit

class OnboardingViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: OnboardingViewCell.self)

    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!

    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescription.text = slide.description
    }
}
