//
//  CanvasController.swift
//  CollectionHomeWork
//
//  Created by Саид Дагалаев on 02.06.2021.
//

import UIKit

class CanvasController : UIViewController {
    let button = ColorButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setButton()
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setButton() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        button.addTarget(self, action: #selector(showColors), for: .touchUpInside)
    }
}

extension CanvasController {
    
    @objc
    func showColors() {
        
    }
}
