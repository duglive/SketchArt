//
//  DrawView.swift
//  CollectionHomeWork
//
//  Created by Антон Сафронов on 05.06.2021.
//

import UIKit

class DrawView: UIView {
        
    func drawElipse(_ start: CGPoint, _ end: CGPoint) {
        
        let a = start
        let b = end
        
        let ab = CGFloat(sqrt(Double(((b.x - a.x) * (b.x - a.x)) + ((b.x - a.x) * (b.x - a.x)))))
        
        let path = UIBezierPath(arcCenter: start, radius: ab, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        self.layer.addSublayer(setShapeLayer(path))
    }
    
    func drawSquare(_ start: CGPoint, _ end: CGPoint) {
        
        let a = start
        let b = end
        
        let ab = CGFloat(sqrt(Double(((b.x - a.x) * (b.x - a.x)) + ((b.x - a.x) * (b.x - a.x)))))
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: CGPoint(x: start.x + ab, y: start.y))
        path.addLine(to: CGPoint(x: start.x + ab, y: start.y + ab))
        path.addLine(to: CGPoint(x: start.x, y: start.y + ab))
        path.addLine(to: start)
        
        self.layer.addSublayer(setShapeLayer(path))
    }
    
    func drawTriangle(_ start: CGPoint, _ end: CGPoint) {
        
        let a = start
        let b = end
        
        let ab = CGFloat(sqrt(Double(((b.x - a.x) * (b.x - a.x)) + ((b.x - a.x) * (b.x - a.x)))))
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: start.x, y: start.y + ab))
        path.addLine(to: CGPoint(x: start.x + ab/2, y: start.y))
        path.addLine(to: CGPoint(x: start.x + ab, y: start.y + ab))
        path.close()
        
        self.layer.addSublayer(setShapeLayer(path))
    }

    func drawRoundedSquare(_ start: CGPoint, _ end: CGPoint) {
        
        let a = start
        let b = end
        
        let ab = CGFloat(sqrt(Double(((b.x - a.x) * (b.x - a.x)) + ((b.x - a.x) * (b.x - a.x)))))
        
        let path = UIBezierPath(roundedRect: CGRect(x: a.x, y: a.y, width: ab, height: ab), cornerRadius: ab/4)

        self.layer.addSublayer(setShapeLayer(path))
    }
    
    func drawLine(_ start: CGPoint, _ end: CGPoint) {
    
        let path = UIBezierPath()
        
        path.move(to: start)
        path.addLine(to: end)
        
        self.layer.addSublayer(setShapeLayer(path))
    }
    
    func drawStraightLine(_ start: CGPoint, _ end: CGPoint) {
        

        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)

        self.layer.addSublayer(setShapeLayer(path))

    }

    func setShapeLayer(_ path: UIBezierPath) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3.0
        return shapeLayer
    }

}
