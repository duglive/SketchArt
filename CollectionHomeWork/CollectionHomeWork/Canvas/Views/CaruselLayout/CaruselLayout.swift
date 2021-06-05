//
//  CaruselFlowLayout.swift
//  CollectionHomeWork
//
//  Created by badyi on 04.06.2021.
//
import UIKit
protocol CaruselLayoutDelegate: AnyObject {
    func setSelected(at indexPath: IndexPath)
}

final class CaruselLayout: UICollectionViewFlowLayout {
    weak var delegate: CaruselLayoutDelegate?
    
    convenience init(with delegate: CaruselLayoutDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = 50
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    var currentItemIndex: Int = 0
//
//    private func updateCurrentItemIndex() {
//        currentItemIndex = Int(itemIndex(offset: collectionView!.contentOffset))
//    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { fatalError("no found collection view in Carusel Layout") }
        // itemSize
        let itemHeight = collectionView.bounds.height - sectionInset.top - sectionInset.bottom
        itemSize = CGSize(width: itemHeight, height: itemHeight)
        
        // horizontal insets
        let horizontalInsets = (collectionView.bounds.width - itemSize.width) / 2
        sectionInset.left = horizontalInsets
        sectionInset.right = horizontalInsets
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { fatalError("no found collection view in Carusel Layout") }
        
        var proposedContentOffset = proposedContentOffset
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + collectionView.bounds.size.width / 2
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
        
        guard let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect) else { return .zero }
        
        for layoutAttributes in layoutAttributesArray {
            let itemHorizontalCenter = layoutAttributes.center.x
            if abs(itemHorizontalCenter - horizontalCenter) < abs(offsetAdjustment) {
                offsetAdjustment = itemHorizontalCenter - horizontalCenter
            }
        }
        
        var nextOffset = proposedContentOffset.x + offsetAdjustment
        let snapStep = itemSize.width + minimumLineSpacing
        
        func isValidOffset(_ offset: CGFloat) -> Bool {
            let minContentOffset = -collectionView.contentInset.left
            let maxContentOffset = collectionView.contentInset.left + collectionView.contentSize.width - itemSize.width
            return offset >= minContentOffset && offset <= maxContentOffset
        }
        
        repeat {
            proposedContentOffset.x = nextOffset
            let deltaX = proposedContentOffset.x - collectionView.contentOffset.x
            let velX = velocity.x
            
            if deltaX.sign.rawValue * velX.sign.rawValue != -1 {
                break
            }
            
            nextOffset += CGFloat(velocity.x.sign.rawValue) * snapStep
        } while isValidOffset(nextOffset)
        
        //updateSelectedCell(with: proposedContentOffset)
        return proposedContentOffset
    }
}


extension CaruselLayout {
//    private func updateSelectedCell(with offset: CGPoint) {
//        let index = Int(itemIndex(offset: offset))
//        delegate?.setSelected(at: IndexPath(row: index, section: 0))
//    }
    
    func itemIndex(offset: CGPoint) -> CGFloat {
        let cellWidth = itemSize.width
        
        let proposedCenterX = collectionView!.screenCenterXOffset(for: offset)
        let itemIndex = proposedCenterX / (cellWidth + minimumLineSpacing)
        
        return itemIndex
    }
}
