//
//  DetailViewController.swift
//  CollectionHomeWork
//
//  Created by badyi on 06.06.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        return view
    }()
    
    private var pictureModel: PictureModel!
    
    init(with pictureModel: PictureModel) {
        super.init(nibName: nil, bundle: nil)
        imageView.image =  pictureModel.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension DetailViewController {
    func setupView() {
        view.addSubview(imageView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func editTapped() {
        navigationController?.pushViewController(CanvasController(), animated: true)
    }
}
