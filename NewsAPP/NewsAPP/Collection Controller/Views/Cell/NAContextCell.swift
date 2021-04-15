//
//  ContextCell.swift
//  NewsAPP
//
//  Created by Настя Сойко on 13.04.21.
//

import UIKit

class ContextCell: UICollectionViewCell {

    //MARK: - variables

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeGroupLabel: UILabel!
    @IBOutlet weak var lecturerLabel: UILabel!

    static let reuseIdentifier = String(describing: ContextCell.self)

    var shedule: Shedule? {
        didSet {
            if let shedule = shedule {
                backgroundImageView.image = shedule.background
                timeGroupLabel.text = shedule.timeAndGroup
                lecturerLabel.text = shedule.lecturer
                titleLabel.text = shedule.title
            }
        }
    }

    //MARK: - actions with animations

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)

        let dragOffset = ContextCellConstant.featuredHeight - ContextCellConstant.stadartHeight

        let delta = 1 - (ContextCellConstant.featuredHeight - frame.height) / dragOffset

        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75

        let scale = max(delta, 0.5)
        titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)

        timeGroupLabel.alpha = delta
        lecturerLabel.alpha = delta

        shadowView.alpha = maxAlpha - delta * (maxAlpha - minAlpha)
    }
}
