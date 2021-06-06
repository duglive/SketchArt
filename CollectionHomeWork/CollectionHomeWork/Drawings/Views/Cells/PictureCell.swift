//
//  PictureCell.swift
//  CollectionHomeWork
//
//  Created by badyi on 31.05.2021.
//

import UIKit

final class PictureCell: UICollectionViewCell {
    static let id = String(describing: self)
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageViewConstraints1: [NSLayoutConstraint] = {
        return [
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
    }()
    
    private lazy var labelConstraints: [NSLayoutConstraint] = {
        return [
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
//            label.heightAnchor.constraint(equalToConstant: 30)
        ]
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        NSLayoutConstraint.activate(imageViewConstraints1)
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}

extension PictureCell {
    func configView(with model: PictureModel) {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = model.image
        label.text = model.name
    }
}
