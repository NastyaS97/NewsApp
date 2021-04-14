//
//  ResizableLayout.swift
//  NewsAPP
//
//  Created by Настя Сойко on 13.04.21.
//

import UIKit

struct ContextCellConstant {
    static let featuredHeight: CGFloat = 200
    static let stadartHeight: CGFloat = 100
}

class ResizableLayout: UICollectionViewLayout {
    let dragOffset: CGFloat = ContextCellConstant.featuredHeight - ContextCellConstant.stadartHeight

    var cacheAttributes = [UICollectionViewLayoutAttributes]()

    var featuredItemIndex: Int {
        max(0, Int(collectionView!.contentOffset.y / dragOffset))
    }

    var percentageOffset: CGFloat {
        collectionView!.contentOffset.y / dragOffset - CGFloat(featuredItemIndex)
    }

    var width: CGFloat {
        collectionView!.bounds.width
    }

    var height: CGFloat {
        collectionView!.bounds.height
    }

    var numberOfItems: Int {
        collectionView!.numberOfItems(inSection: 0)
    }
}

extension ResizableLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }

    override var collectionViewContentSize: CGSize {
        CGSize(
            width: width,
            height: CGFloat(numberOfItems) * dragOffset + height - dragOffset)
    }
    override func prepare() {
        cacheAttributes.removeAll()

        var frame: CGRect = .zero
        var y: CGFloat = 0

        for index in 0..<numberOfItems {
            let path = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: path)

            var height = ContextCellConstant.stadartHeight

            if path.item == featuredItemIndex {
                y = collectionView!.contentOffset.y - ContextCellConstant.stadartHeight * percentageOffset
                height = ContextCellConstant.featuredHeight
            } else if path.item == (featuredItemIndex + 1) {
                height = ContextCellConstant.stadartHeight + max(0, dragOffset * percentageOffset)

                let maxY = y + ContextCellConstant.stadartHeight
                y = maxY - height
            }

            frame = CGRect(x: 0, y: y, width: width, height: height)

            attributes.frame = frame

            attributes.zIndex = index
            cacheAttributes.append(attributes)
            y = frame.maxY
        }
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var resultAttributes = [UICollectionViewLayoutAttributes]()

        for attributes in cacheAttributes {
            if attributes.frame.intersects(rect) {
                resultAttributes.append(attributes)
            }
        }
        return resultAttributes
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        let index = round(proposedContentOffset.y / dragOffset)
        let y = index * dragOffset
        return CGPoint(x: 0, y: y)
    }
}
