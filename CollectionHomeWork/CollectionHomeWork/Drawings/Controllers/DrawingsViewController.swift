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
        pictures = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 ,24].map { PictureModel(with: UIImage(named: "\($0)")!)
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.setupAdditinalMenu()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}

extension DrawingsViewController: DrawingsViewDelegate {
    func picturesCount() -> Int {
        pictures.count
    }
    
    func picture(at index: IndexPath) -> PictureModel {
        pictures[index.row]
    }
    
    func newDrawing() {
        navigationController?.pushViewController(CanvasController(), animated: true)
    }
    
    func firstCellisHidden() {
        navigationController?.isNavigationBarHidden = false
    }
    
    func firstCellisntHidden() {
        navigationController?.isNavigationBarHidden = true
    }
}
