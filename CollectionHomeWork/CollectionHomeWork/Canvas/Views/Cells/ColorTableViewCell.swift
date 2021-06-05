//
//  ColorTableViewCell.swift
//  CollectionHomeWork
//
//  Created by Саид Дагалаев on 02.06.2021.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    let colorView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setView()
    }
    
    func setView() {
        addSubview(colorView)
        colorView.layer.borderWidth = 1
        colorView.layer.borderColor = UIColor.black.cgColor
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            colorView.leftAnchor.constraint(equalTo: self.leftAnchor),
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(color: UIColor) {
        colorView.backgroundColor = color
    }
}
