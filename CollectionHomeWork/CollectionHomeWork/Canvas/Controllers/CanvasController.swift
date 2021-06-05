//
//  CanvasController.swift
//  CollectionHomeWork
//
//  Created by Саид Дагалаев on 02.06.2021.
//

import UIKit

final class CanvasController : UIViewController {
//    точки для рисования в draw
    private var startPoint = CGPoint()
    private var endPoint = CGPoint()
    
//    список фигур для рисования
    enum Figurs {
        case square
        case elipse
        case triangle
        case roundedSquare
        case line
        case straightLine
    }
//    дефолтная фигура для рисования
    var fig: Figurs = .triangle
    
    var tableView = ColorTableView()
    let colorButton = ColorButton()
    
    private lazy var toolCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ToolCell.self, forCellWithReuseIdentifier: ToolCell.id)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let colorArr = [#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), .red, #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
    
//    кнопки для выбора фигур
    lazy var selectedFigur1: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Круг", for: .normal)
        b.addTarget(self, action: #selector(selectFig), for: .touchUpInside)
        b.backgroundColor = .black
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var selectedFigur2: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Квадрат", for: .normal)
        b.addTarget(self, action: #selector(selectFig), for: .touchUpInside)
        b.backgroundColor = .black
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var selectedFigur3: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Треугольник", for: .normal)
        b.addTarget(self, action: #selector(selectFig), for: .touchUpInside)
        b.backgroundColor = .black
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var selectedFigur4: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Скруглённый квадрат", for: .normal)
        b.addTarget(self, action: #selector(selectFig), for: .touchUpInside)
        b.backgroundColor = .black
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var selectedFigur5: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Линия", for: .normal)
        b.addTarget(self, action: #selector(selectFig), for: .touchUpInside)
        b.backgroundColor = .black
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var selectedFigur6: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Прямая", for: .normal)
        b.addTarget(self, action: #selector(selectFig), for: .touchUpInside)
        b.backgroundColor = .black
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
//вьюха, в которой рисуем наши фигуры
    lazy var drawView: DrawView = {
        let v = DrawView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
// ловим жесты
    lazy var panGesture: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(drawFigur(_:)))
        return gesture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setColorButton()
        setDoneButton()
        setUndoButton()
        setTableView()
        setupToolCollectionView()
        
//        кнопки, вьюха и жесты
        view.addSubview(drawView)
        view.addSubview(selectedFigur1)
        view.addSubview(selectedFigur2)
        view.addSubview(selectedFigur3)
        view.addSubview(selectedFigur4)
        view.addSubview(selectedFigur5)
        view.addSubview(selectedFigur6)
        drawView.addGestureRecognizer(panGesture)
        setAncors()
    }
    
    
    private func setAncors() {
        NSLayoutConstraint.activate([

            selectedFigur1.heightAnchor.constraint(equalToConstant: 40),
            selectedFigur1.widthAnchor.constraint(equalToConstant: 40),
            selectedFigur1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            selectedFigur1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            selectedFigur2.heightAnchor.constraint(equalToConstant: 40),
            selectedFigur2.widthAnchor.constraint(equalToConstant: 40),
            selectedFigur2.leadingAnchor.constraint(equalTo: selectedFigur1.trailingAnchor, constant: 20),
            selectedFigur2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            selectedFigur3.heightAnchor.constraint(equalToConstant: 40),
            selectedFigur3.widthAnchor.constraint(equalToConstant: 40),
            selectedFigur3.leadingAnchor.constraint(equalTo: selectedFigur2.trailingAnchor, constant: 20),
            selectedFigur3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            selectedFigur4.heightAnchor.constraint(equalToConstant: 40),
            selectedFigur4.widthAnchor.constraint(equalToConstant: 40),
            selectedFigur4.leadingAnchor.constraint(equalTo: selectedFigur3.trailingAnchor, constant: 20),
            selectedFigur4.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            selectedFigur5.heightAnchor.constraint(equalToConstant: 40),
            selectedFigur5.widthAnchor.constraint(equalToConstant: 40),
            selectedFigur5.leadingAnchor.constraint(equalTo: selectedFigur4.trailingAnchor, constant: 20),
            selectedFigur5.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            selectedFigur6.heightAnchor.constraint(equalToConstant: 40),
            selectedFigur6.widthAnchor.constraint(equalToConstant: 40),
            selectedFigur6.leadingAnchor.constraint(equalTo: selectedFigur5.trailingAnchor, constant: 20),
            selectedFigur6.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            drawView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            drawView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            drawView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            drawView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25)
            
        ])
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setColorButton() {
        colorButton.pin(view: self.view)
        colorButton.addTarget(self, action: #selector(showColors), for: .touchUpInside)
    }
    
    func setDoneButton() {
        let doneButton = BaseButton(imageName: "checkmark.square")
        doneButton.pin(view: self.view)
        doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
    }
    
    func setUndoButton() {
        let undoButton = BaseButton(imageName: "arrow.uturn.backward.square")
        undoButton.pin(view: self.view)
        undoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -72).isActive = true
        undoButton.addTarget(self, action: #selector(undoAction), for: .touchUpInside)
    }
    
    func setTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(view: colorButton)
    }
    
    func setupToolCollectionView() {
        view.addSubview(toolCollection)
        NSLayoutConstraint.activate([
            toolCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolCollection.heightAnchor.constraint(equalToConstant: 100),
            toolCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    @objc func drawFigur(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard gestureRecognizer.view != nil else {return}
        
        if gestureRecognizer.state == .began {
            startPoint = gestureRecognizer.location(in: drawView)
        }
        
        if gestureRecognizer.state == .changed {

            if fig == .line {
                let currentPoint = gestureRecognizer.location(in: drawView)
                drawView.drawLine(startPoint, currentPoint)
                startPoint = currentPoint
            }
        }
        
        if gestureRecognizer.state == .ended {
            endPoint = gestureRecognizer.location(in: drawView)
            
            switch fig {
            case .elipse:
                drawView.drawElipse(startPoint, endPoint)
            case .square:
                drawView.drawSquare(startPoint, endPoint)
            case .triangle:
                drawView.drawTriangle(startPoint, endPoint)
            case .roundedSquare:
                drawView.drawRoundedSquare(startPoint, endPoint)
            case .line:
                drawView.drawLine(startPoint, startPoint)
            case .straightLine:
                drawView.drawStraightLine(startPoint, endPoint)
            }
        }
    }

    
    @objc func selectFig(_ sender: UIButton) {
        
        switch sender.titleLabel?.text {
        case "Круг":
            fig = .elipse
        case "Квадрат":
            fig = .square
        case "Треугольник":
            fig = .triangle
        case "Скруглённый квадрат":
            fig = .roundedSquare
        case "Линия":
            fig = .line
        case "Прямая":
            fig = .straightLine
        default:
            break
        }
    }
    
    

}

extension CanvasController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ColorTableViewCell()
        cell.config(color: colorArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        34
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorButton.backgroundColor = colorArr[indexPath.row]
        tableView.isHidden = true
    }
}

extension CanvasController {
    
    @objc
    func showColors() {
        tableView.isHidden = tableView.isHidden ? false : true
    }
    
    @objc
    func doneAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func undoAction() {
        
    }
}

extension CanvasController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = toolCollection.dequeueReusableCell(withReuseIdentifier: ToolCell.id, for: indexPath) as! ToolCell
        cell.backgroundColor = .brown
        return cell
    }
}
