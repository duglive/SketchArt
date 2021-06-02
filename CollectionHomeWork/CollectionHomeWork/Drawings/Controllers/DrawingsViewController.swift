//
//  ViewController.swift
//  CollectionHomeWork
//
//  Created by badyi on 29.05.2021.
//

import UIKit

final class DrawingsViewController: UIViewController {
    private var myView: DrawingsViewProtocol
    private(set) var pictures: [PictureModel]
    
    init(with view: DrawingsViewProtocol) {
        self.myView = view
        pictures = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].map { value in
            return PictureModel(with: UIImage(named: "\(value)")!)
        }
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
    func picturesCount() -> Int {
        pictures.count + 1
    }
    
    func picture(at index: IndexPath) -> PictureModel {
        pictures[index.row - 1]
    }
    
    func newDrawing() {
        navigationController?.pushViewController(CanvasController(), animated: true)
    }
}
