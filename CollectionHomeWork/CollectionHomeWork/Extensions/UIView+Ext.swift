//
//  UIView+Ext.swift
//  CollectionHomeWork
//
//  Created by Саид Дагалаев on 06.06.2021.
//

import UIKit

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
