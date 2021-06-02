//
//  CanvasController.swift
//  CollectionHomeWork
//
//  Created by Саид Дагалаев on 02.06.2021.
//

import UIKit

class CanvasController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setColorButton()
        setDoneButton()
        setUndoButton()
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setColorButton() {
        let colorButton = ColorButton()
        
        view.addSubview(colorButton)
        
        NSLayoutConstraint.activate([
            colorButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            colorButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        colorButton.addTarget(self, action: #selector(showColors), for: .touchUpInside)
    }
    
    func setDoneButton() {
        let doneButton = UIButton()
        doneButton.tintColor = .black
        doneButton.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            doneButton.heightAnchor.constraint(equalToConstant: 30),
            doneButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
    }
    
    func setUndoButton() {
        let undoButton = UIButton()
        undoButton.tintColor = .black
        undoButton.setBackgroundImage(UIImage(systemName: "arrow.uturn.backward.square"), for: .normal)
        undoButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(undoButton)
        
        NSLayoutConstraint.activate([
            undoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -72),
            undoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            undoButton.heightAnchor.constraint(equalToConstant: 30),
            undoButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        undoButton.addTarget(self, action: #selector(undoAction), for: .touchUpInside)
    }
}

extension CanvasController {
    
    @objc
    func showColors() {
        
    }
    
    @objc
    func doneAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func undoAction() {
        
    }
}
