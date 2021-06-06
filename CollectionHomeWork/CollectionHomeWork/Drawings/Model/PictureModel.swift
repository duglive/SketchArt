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
    var name: String
    
    init(with image: UIImage, name: String = "") {
        self.image = image
        self.name = name
        originalImage = image
        
    }
}
