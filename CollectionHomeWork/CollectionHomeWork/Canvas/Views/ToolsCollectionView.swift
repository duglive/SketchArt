//
//  ToolsCollectionView.swift
//  CollectionHomeWork
//
//  Created by badyi on 05.06.2021.
//

import UIKit

protocol ToolsViewProtocol {
    func scrollToItem(at index: IndexPath)
}

protocol ToolsViewDelegate: AnyObject {
    func didSelectTool(at index: IndexPath)
    func item(at index: IndexPath) -> ToolType
    func itemsCount() -> Int
}

final class ToolsCollectionView: UIView {
    weak var delegate: ToolsViewDelegate?
    var selected: Int = 0
    private lazy var toolsCollection: UICollectionView = {
        let layout = CaruselLayout(with: self)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ToolCell.self, forCellWithReuseIdentifier: ToolCell.id)
        cv.backgroundColor = .lightGray
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.alwaysBounceHorizontal = true
        cv.delegate = self
        cv.dataSource = self
        cv.decelerationRate = .normal
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    func setupToolCollectionView() {
        addSubview(toolsCollection)
        NSLayoutConstraint.activate([
            toolsCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            toolsCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            toolsCollection.topAnchor.constraint(equalTo: topAnchor),
            toolsCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    init(with delegate: ToolsViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupToolCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ToolsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.itemsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = toolsCollection.dequeueReusableCell(withReuseIdentifier: ToolCell.id, for: indexPath) as! ToolCell
        guard let tool = delegate?.item(at: indexPath) else { return cell }
        cell.configView(with: tool)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        scrollToItem(at: indexPath)
        selected = indexPath.row
        delegate?.didSelectTool(at: indexPath)
    }
}

extension ToolsCollectionView: ToolsViewProtocol {
    func scrollToItem(at index: IndexPath) {
        toolsCollection.selectItem(at: index, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension ToolsCollectionView: CaruselLayoutDelegate {
    func setSelected(at indexPath: IndexPath) {
//        var index = indexPath
//        guard let delegate = delegate else { return }
//        if index.row < 0 { index.row = 0 }
//        let count = delegate.itemsCount()
//        if index.row > count { index.row = count - 1 }
//
//        selected = index.row
    }
}
