//
//  BaseButton.swift
//  CollectionHomeWork
//
//  Created by Саид Дагалаев on 02.06.2021.
//

import UIKit

class BaseButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(imageName: String) {
        self.init(frame: .zero)
        
        tintColor = .black
        setBackgroundImage(UIImage(systemName: imageName), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func pin(view: UIView) {
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            heightAnchor.constraint(equalToConstant: 30),
            widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
