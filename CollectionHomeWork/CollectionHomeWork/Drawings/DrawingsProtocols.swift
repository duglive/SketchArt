//
//  DrawingsProtocols.swift
//  CollectionHomeWork
//
//  Created by badyi on 02.06.2021.
//

import Foundation

protocol DrawingsViewDelegate: AnyObject {
    func newDrawing()
    func picturesCount() -> Int
    func picture(at index: IndexPath) -> PictureModel
    func firstCellisHidden()
    func firstCellisntHidden()
    func didTap(at index: IndexPath)
    func didTapNewDrawingButton()
    func selected(at index: IndexPath)
}

protocol DrawingsViewProtocol: AnyObject {
    func setupView()
    func setupAdditinalMenu()
}
