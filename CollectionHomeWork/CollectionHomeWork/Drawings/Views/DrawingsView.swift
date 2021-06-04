//
//  DrawingsView.swift
//  CollectionHomeWork
//
//  Created by badyi on 02.06.2021.
//

import UIKit

final class DrawingsView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = CustomLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.register(PictureCell.self, forCellWithReuseIdentifier: PictureCell.id)
        return cv
    }()
    
    private lazy var additinalMenu: AdditinalMenuView = {
        let view = AdditinalMenuView()
        return view
    }()
    
    private let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    private var cellHeight: CGFloat = 0
    
    weak var delegate: DrawingsViewDelegate!
}

extension DrawingsView: DrawingsViewProtocol {
    func setupAdditinalMenu() {
        let menuHeight = DConstants.additinalMenuHeight
        
        additinalMenu.frame = CGRect(x: 0, y: -menuHeight - -statusBarHeight, width: collectionView.frame.width, height: menuHeight)
    }
    
    func setupView() {
        addSubview(collectionView)
        addSubview(additinalMenu)
        additinalMenu.buttonTapped = { [weak self] in
            self?.delegate.didTapNewDrawingButton()
        }
        additinalMenu.set(text: "You have \(delegate.picturesCount() - 1) drawings")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension DrawingsView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if cellHeight == 0 { return }
        let offsetY = scrollView.contentOffset.y
        let menuHeight = DConstants.additinalMenuHeight
        
        if offsetY > cellHeight - statusBarHeight {
            additinalMenu.frame = CGRect(x: 0, y: statusBarHeight, width: collectionView.bounds.width, height: menuHeight)
        } else {
            additinalMenu.frame = CGRect(x: 0, y: -menuHeight - -statusBarHeight, width: collectionView.frame.width, height: menuHeight)
        }
    }
}

extension DrawingsView: UICollectionViewDelegate {}

extension DrawingsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.picturesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.id, for: indexPath) as! PictureCell
        
        cell.configView(with: delegate.picture(at: indexPath))
        
        if indexPath.row == 0 {
            cellHeight = cell.bounds.height
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didTap(at: indexPath)
    }
}

extension DrawingsView: CustomLayoutDelegate {
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
