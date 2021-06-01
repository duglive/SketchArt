//
//  PictureCell.swift
//  CollectionHomeWork
//
//  Created by badyi on 31.05.2021.
//

import UIKit

final class PictureCell: UICollectionViewCell {
    static let id = "picCell"
    
    private lazy var label: UILabel = {
        let label = UILabel()
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
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
    }
    
    func config(with index: IndexPath) {
        label.text = "\(index.row)"
    }
}
