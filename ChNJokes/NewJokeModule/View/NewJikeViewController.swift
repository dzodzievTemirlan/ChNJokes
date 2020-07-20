//
//  NewJikeViewController.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class NewJokeViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 2
            shapeLayer.lineCap = .square
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        shapeLayer = CAShapeLayer()
        textView.becomeFirstResponder()
        textView.delegate = self
        textView.layer.addSublayer(shapeLayer)
    }
    override func viewDidLayoutSubviews() {
        shapeLayer.frame = textView.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: textView.frame.minX, y: textView.frame.maxY ))
        path.addLine(to: CGPoint(x: textView.frame.maxX, y: textView.frame.maxY ))
        shapeLayer.path = path.cgPath
    }
    @IBAction func saveAction(_ sender: UIButton) {
    }
    @IBAction func cancelAction(_ sender: UIButton) {
    }
}
