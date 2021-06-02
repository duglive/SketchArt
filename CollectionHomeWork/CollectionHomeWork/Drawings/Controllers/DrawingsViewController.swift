//
//  ViewController.swift
//  CollectionHomeWork
//
//  Created by badyi on 29.05.2021.
//

import UIKit

class DrawingsViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = CustomLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .orange
        cv.register(PictureCell.self, forCellWithReuseIdentifier: PictureCell.id)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
}

extension DrawingsViewController {
    func configView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DrawingsViewController: UICollectionViewDelegate {
    
}

extension DrawingsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.id, for: indexPath) as! PictureCell
        cell.config(with: indexPath)
        if indexPath.row % 4 == 0 {
            cell.backgroundColor = .blue
        } else if indexPath.row % 4 == 1 {
            cell.backgroundColor = .red
        } else if indexPath.row % 4 == 2 {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .cyan
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(CanvasController(), animated: true)
        }
    }
}

extension DrawingsViewController: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeForViewAtIndexPath indexPath: IndexPath) -> Int {
        if indexPath.row % 12 == 3 || indexPath.row % 12 == 10 {
            return 2
        }
        return 1
    }
    
    func numberOfColumnsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
}
