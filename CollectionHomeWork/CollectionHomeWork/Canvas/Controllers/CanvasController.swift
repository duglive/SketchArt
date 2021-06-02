//
//  CanvasController.swift
//  CollectionHomeWork
//
//  Created by Саид Дагалаев on 02.06.2021.
//

import UIKit

class CanvasController : UIViewController {
    
    var tableView = ColorTableView()
    let colorButton = ColorButton()
    
    let colorArr = [#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), .red, #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setColorButton()
        setDoneButton()
        setUndoButton()
        setTableView()
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
