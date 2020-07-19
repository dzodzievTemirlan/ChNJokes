//
//  MainJokeViewCell.swift
//  ChNJokes
//
//  Created by Temirlan Dzodziev on 17.07.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit


class MainJokeViewCell: UITableViewCell {
    @IBOutlet weak var jokeLabel: UILabel!
    weak var shareButtonPressed: MyJokeTableViewCellProtocol?
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        guard let text = jokeLabel.text else { return }
        let joke = [text]
        let activitity = UIActivityViewController(activityItems: joke, applicationActivities: nil)
        shareButtonPressed?.shareWith(activity: activitity)
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        guard let joke = jokeLabel.text else {return}
        CoreDataService.shared.createNewItem(joke: joke)
    }
}
