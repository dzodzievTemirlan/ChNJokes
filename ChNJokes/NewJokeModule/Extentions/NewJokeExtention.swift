//
//  NewJokeExtention.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

extension NewJokeViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        counterInt = newText.count
        return numberOfChars <= 140    // 10 Limit Value
    }
}
