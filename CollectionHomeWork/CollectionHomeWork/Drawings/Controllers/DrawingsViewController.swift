//
//  ViewController.swift
//  CollectionHomeWork
//
//  Created by badyi on 29.05.2021.
//

import UIKit

final class DrawingsViewController: UIViewController {
    private var myView: DrawingsViewProtocol
    var pictures: [PictureModel]
    
    init(with view: DrawingsViewProtocol) {
        self.myView = view
        self.pictures = Assembly.pictures
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = (myView as! UIView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.setupView()
        myView.setupAdditinalMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

extension DrawingsViewController: DrawingsViewDelegate {
    func selected(at index: IndexPath) {
        navigationController?.pushViewController(DetailViewController(with: pictures[index.row]), animated: true)
    }
    
    func didTapNewDrawingButton() {
        newDrawing()
    }
    
    func didTap(at index: IndexPath) {
        if index.row == 0 {
            didTapNewDrawingButton()
            return
        }
        selected(at: index)
    }
    
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
