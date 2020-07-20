//
//  NewJikeViewController.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class NewJokeViewController: UIViewController {
    var presenter:NewJokePresenter!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var saveOutlet: UIButton!
    var counterInt: Int = 0 {
        didSet {
            if counterInt <= 140 {
                counterLabel.text = "\(counterInt)/ 140"
            }
            if counterInt > 0 {
                saveOutlet.isEnabled = true
            } else {
                saveOutlet.isEnabled = false
            }
        }
    }
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 3
            shapeLayer.lineCap = .square
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        shapeLayer = CAShapeLayer()
        textView.delegate = self
        textView.becomeFirstResponder()
        subView.layer.addSublayer(shapeLayer)
        counterLabel.text = "\(counterInt)/ 140"
        saveOutlet.isEnabled = false
    }
    override func viewDidLayoutSubviews() {
        shapeLayer.frame = textView.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: textView.frame.minX, y: textView.frame.maxY))    //начальная точка отрисовк
        path.addLine(to: CGPoint(x: textView.frame.maxX, y: textView.frame.maxY)) // конечная точка отрисовки
        shapeLayer.path = path.cgPath //добавляем путь отрисоки
    }
    @IBAction func saveAction(_ sender: UIButton) {
        guard let text = textView.text else { return }
        presenter.saveJoke(joke: text)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func cancelAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
