//
//  DrawingsProtocols.swift
//  CollectionHomeWork
//
//  Created by badyi on 02.06.2021.
//

import Foundation

protocol DrawingsViewDelegate: AnyObject {
    func newDrawing()
}

protocol DrawingsViewProtocol: AnyObject {
    func setupView()
}
