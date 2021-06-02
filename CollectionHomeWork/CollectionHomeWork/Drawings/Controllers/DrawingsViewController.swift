//
//  ViewController.swift
//  CollectionHomeWork
//
//  Created by badyi on 29.05.2021.
//

import UIKit

class DrawingsViewController: UIViewController {
    private var myView: DrawingsViewProtocol
    
    init(with view: DrawingsViewProtocol) {
        self.myView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = (myView as! UIView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.setupView()
    }
}

extension DrawingsViewController: DrawingsViewDelegate {
    func newDrawing() {
        navigationController?.pushViewController(CanvasController(), animated: true)
    }
}
