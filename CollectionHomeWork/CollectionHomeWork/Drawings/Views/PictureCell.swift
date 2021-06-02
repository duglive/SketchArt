//
//  PictureCell.swift
//  CollectionHomeWork
//
//  Created by badyi on 31.05.2021.
//

import UIKit

final class PictureCell: UICollectionViewCell {
    static let id = String(describing: self)
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            label.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func config(with index: IndexPath) {
        if index.row == 0 {
            label.text = "Новый рисунок"
        } else {
            label.text = "\(index.row)"
        }
    }
}
