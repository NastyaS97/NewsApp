//
//  NACollectionWithTimeTable.swift
//  NewsAPP
//
//  Created by Настя Сойко on 13.04.21.
//

import UIKit

class NACollectionWithTimeTable: UICollectionViewController {
    let shedules = SheduleStorage.shedule

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundView = UIImageView(image: Assets.image.background)
        collectionView?.backgroundView = backgroundView

        collectionView?.backgroundColor = .clear
        collectionView?.decelerationRate = .fast
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shedules.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContexCell.reuseIdentifier,
                                                            for: indexPath) as? ContexCell else {
            return UICollectionViewCell()
        }
        cell.shedule = shedules[indexPath.item]
        return cell
    }
}

