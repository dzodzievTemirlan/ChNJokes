//
//  SettingViewController.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 19.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    weak var presenter: SettingPresenterViewProtocol?
    
    var shapeLayerOne: CAShapeLayer! {
        didSet {
            shapeLayerOne.lineWidth = 1
            shapeLayerOne.lineCap = .square
            shapeLayerOne.fillColor = nil
            shapeLayerOne.strokeEnd = 1
            shapeLayerOne.strokeColor = #colorLiteral(red: 0.7686134577, green: 0.7685713768, blue: 0.7771573663, alpha: 1).cgColor
        }
    }
    var shapeLayerTwo: CAShapeLayer! {
        didSet {
            shapeLayerTwo.lineWidth = 1
            shapeLayerTwo.lineCap = .square
            shapeLayerTwo.fillColor = nil
            shapeLayerTwo.strokeEnd = 1
            shapeLayerTwo.strokeColor = #colorLiteral(red: 0.7686134577, green: 0.7685713768, blue: 0.7771573663, alpha: 1).cgColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shapeLayerOne = CAShapeLayer()
        shapeLayerTwo = CAShapeLayer()
        subView.layer.addSublayer(shapeLayerOne)
        subView.layer.addSublayer(shapeLayerTwo)
    }
    
    override func viewDidLayoutSubviews() {
        addLine(firstnameTextField, shapeLayerOne)
        addLine(lastnameTextField, shapeLayerTwo)
    }
    fileprivate func addLine(_ textField: UITextField,_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = textField.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: textField.frame.minX, y: textField.frame.maxY))
        path.addLine(to: CGPoint(x: textField.frame.maxX, y: textField.frame.maxY))
        shapeLayer.path = path.cgPath
    }
    
    @IBAction func switchMode(_ sender: UISwitch) {
        
    }
    
}

extension SettingViewController: SettingPresenterProtocol {
}
