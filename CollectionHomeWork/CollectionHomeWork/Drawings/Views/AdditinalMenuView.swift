//
//  AdditinalMenuView.swift
//  CollectionHomeWork
//
//  Created by badyi on 02.06.2021.
//

import UIKit

final class AdditinalMenuView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        return button
    }()
    
    var buttonTapped: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AdditinalMenuView {
    func setupView() {
        addSubview(label)
        addSubview(button)
        button.backgroundColor = .white
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.widthAnchor.constraint(equalTo: widthAnchor, constant: -100),

            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func set(text: String) {
        label.text = text
    }
    
    @objc private func clicked() {
        guard let tap = buttonTapped else { return }
        tap()
    }
}
