//
//  MyJokeTableViewCell.swift
//  ChNJokes
//
//  Created by Азизбек on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

protocol MyJokeTableViewCellProtocol: class {
    func shareWith(activity: UIActivityViewController)
}

class MyJokeTableViewCell: UITableViewCell {
    var item: Item?
    weak var myJokeTableViewCellDelegate: MyJokeTableViewCellProtocol?
    @IBOutlet weak var jokeLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        guard let item = item else { return }
        jokeLabel.text = item.joke
    }

    @IBAction func shareAction(_ sender: UIButton) {
        guard let text = jokeLabel.text else { return }
        let joke = [text]
        let activity = UIActivityViewController(activityItems: joke, applicationActivities: nil)
        myJokeTableViewCellDelegate?.shareWith(activity: activity)
//        present(ac, animated: true)
    }
}
