//
//  PictureModel.swift
//  CollectionHomeWork
//
//  Created by badyi on 02.06.2021.
//

import UIKit

final class PictureModel {
    private(set) var image: UIImage
    private(set) var originalImage: UIImage
    
    init(with image: UIImage) {
        self.image = image
        originalImage = image
    }
    
    func set(_ image: UIImage) {
        self.image = image
    }
}
