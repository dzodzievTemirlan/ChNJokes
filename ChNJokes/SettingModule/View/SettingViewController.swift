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
    @IBOutlet weak var saveButton: UIButton!
    weak var presenter: SettingPresenterViewProtocol?
    // MARK: - Line #1
    var shapeLayerOne: CAShapeLayer! {
        didSet {
            shapeLayerOne.lineWidth = 1
            shapeLayerOne.lineCap = .square
            shapeLayerOne.fillColor = nil
            shapeLayerOne.strokeEnd = 1
            shapeLayerOne.strokeColor = #colorLiteral(red: 0.7686134577, green: 0.7685713768, blue: 0.7771573663, alpha: 1).cgColor
        }
    }
    // MARK: - Line #2
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
        saveButton.layer.cornerRadius = 25
    }
    override func viewDidLayoutSubviews() {
        addLine(firstnameTextField, shapeLayerOne)
        addLine(lastnameTextField, shapeLayerTwo)
    }
    // MARK: - Add line on View method
    fileprivate func addLine(_ textField: UITextField,_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = textField.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: textField.frame.minX, y: textField.frame.maxY))
        path.addLine(to: CGPoint(x: textField.frame.maxX, y: textField.frame.maxY))
        shapeLayer.path = path.cgPath
    }
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        //TODO: Сделать нормальную логику замены имени
        guard let firstName = firstnameTextField.text else {return}
        guard let lastName = lastnameTextField.text else {return}
        CoreDataService.shared.fetchPerson { (person, error) in
                   if error == nil {
                       if person?.isEmpty == false {
                           CoreDataService.shared.deletePerson(person: person![0])
                       }
                   }
               }
        CoreDataService.shared.savePerson(firstName: firstName, lastName: lastName)
       
    }
    @IBAction func switchMode(_ sender: UISwitch) {
        //TODO: Offline Moode: 1. Отключить get-запрос, 2. подкинуть в датасорс что нибудь из локалки по тряске телефона
    }
}
//TODO: Изменить логику сборки, чтобы не было протокола для протокола
extension SettingViewController: SettingPresenterProtocol {
}
