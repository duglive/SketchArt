//
//  ScrollViewExtension.swift
//  CollectionHomeWork
//
//  Created by badyi on 05.06.2021.
//

import UIKit

extension UIScrollView {
    func screenCenterXOffset(for offset: CGPoint? = nil) -> CGFloat {
        let offsetX = offset?.x ?? contentOffset.x
        let contentOffsetX = offsetX + bounds.width / 2

        return contentOffsetX
    }
}
