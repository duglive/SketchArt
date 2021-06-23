//
//  DrawView.swift
//  CollectionHomeWork
//
//  Created by Антон Сафронов on 05.06.2021.
//

import UIKit

class DrawView: UIView {
    var startPoint = CGPoint()
    var endPoint = CGPoint()
    
    var arrCounterOfFigurs = [Int]()
    var lineCounter = 0
    
    var currentColor: UIColor = .red
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func drawElipse(_ start: CGPoint, _ end: CGPoint) {
        let a = start
        let b = end
        
        let ab = CGFloat(sqrt(Double(((b.x - a.x) * (b.x - a.x)) + ((b.x - a.x) * (b.x - a.x)))))
        let path = UIBezierPath(arcCenter: start, radius: ab, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        removeSublayers()
        self.layer.addSublayer(setShapeLayer(path))
    }
    
    func drawSquare(_ start: CGPoint, _ end: CGPoint) {
 
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: CGPoint(x: end.x, y: start.y))
        path.addLine(to: CGPoint(x: end.x, y: end.y))
        path.addLine(to: CGPoint(x: start.x, y: end.y))
        path.addLine(to: start)
        removeSublayers()
        self.layer.addSublayer(setShapeLayer(path))
    }
    
    func drawTriangle(_ start: CGPoint, _ end: CGPoint) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: (start.x + end.x)/2, y: start.y))
        path.addLine(to: CGPoint(x: end.x, y: end.y))
        path.addLine(to: CGPoint(x: start.x, y: end.y))
        path.close()
        removeSublayers()
        self.layer.addSublayer(setShapeLayer(path))
    }

    func drawRoundedSquare(_ start: CGPoint, _ end: CGPoint) {
        
        var startP = start
        var endP = end
        
        let ab = CGFloat(sqrt(Double(((endP.x - startP.x) * (endP.x - startP.x)) + ((endP.x - startP.x) * (endP.x - startP.x)))))
        let cornerRadius: CGFloat = ab/4
        
        if startP.y > endP.y  {
            let temp = startP.y
            startP.y = endP.y
            endP.y = temp
        }
        
        if startP.x > endP.x  {
            let temp = startP.x
            startP.x = endP.x
            endP.x = temp
        }
        
        let path = UIBezierPath()
        //arc a
        path.addArc(withCenter: CGPoint(x: endP.x - cornerRadius, y: startP.y - cornerRadius), radius: ab/4, startAngle: 3*CGFloat.pi/2, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: endP.x, y: endP.y - cornerRadius))

        //arc b
        path.addArc(withCenter: CGPoint(x: endP.x - cornerRadius, y: endP.y - cornerRadius), radius: ab/4, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: startP.x + cornerRadius, y: endP.y))

        //arc c
        path.addArc(withCenter: CGPoint(x: startP.x + cornerRadius, y: endP.y - cornerRadius), radius: ab/4, startAngle: CGFloat.pi/2, endAngle: CGFloat.pi, clockwise: true)
        path.addLine(to: CGPoint(x: startP.x, y: startP.y - cornerRadius))

        //arc d
        path.addArc(withCenter: CGPoint(x: startP.x + cornerRadius, y: startP.y - cornerRadius), radius: ab/4, startAngle: CGFloat.pi, endAngle: 3*CGFloat.pi/2, clockwise: true)
        path.close()

        removeSublayers()
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
        removeSublayers()
        self.layer.addSublayer(setShapeLayer(path))
    }

    private func setShapeLayer(_ path: UIBezierPath) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = currentColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3.0
        return shapeLayer
    }
    
    private func removeSublayers() {
        if let countSublayers = self.layer.sublayers?.count {
            if countSublayers > arrCounterOfFigurs.reduce(0, +) {
                self.layer.sublayers?.removeLast()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pin(view: UIView) {
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

    func setupImage(_ image: UIImage) {
        let imageView = UIImageView(image: image)
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
