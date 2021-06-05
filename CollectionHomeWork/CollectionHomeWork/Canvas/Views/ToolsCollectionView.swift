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
}

final class ToolsCollectionView: UIView {
    weak var delegate: ToolsViewDelegate!
    
    private lazy var toolsCollection: UICollectionView = {
        let layout = CaruselLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ToolCell.self, forCellWithReuseIdentifier: ToolCell.id)
        cv.backgroundColor = .systemTeal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.alwaysBounceHorizontal = true
        cv.delegate = self
        cv.dataSource = self
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
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = toolsCollection.dequeueReusableCell(withReuseIdentifier: ToolCell.id, for: indexPath) as! ToolCell
        let tool = delegate.item(at: indexPath)
        cell.configView(with: tool)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        scrollToItem(at: indexPath)
        delegate.didSelectTool(at: indexPath)
    }
}

extension ToolsCollectionView: ToolsViewProtocol {
    func scrollToItem(at index: IndexPath) {
        toolsCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
}
