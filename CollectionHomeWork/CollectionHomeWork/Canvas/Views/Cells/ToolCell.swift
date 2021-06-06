//
//  ToolCell.swift
//  CollectionHomeWork
//
//  Created by badyi on 04.06.2021.
//

import UIKit

final class ToolCell: UICollectionViewCell {
    static var id = String(describing: self)
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        self.layer.cornerRadius = frame.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}

extension ToolCell {
    func configView(with tool: ToolType) {
        imageView.image = UIImage(named: tool.rawValue)
        contentView.backgroundColor = .white
    }
}

extension ToolCell
{
    override var isSelected: Bool{
        didSet{
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.2, y: 1.2) : CGAffineTransform.identity
            }, completion: nil)
        }
    }
}
