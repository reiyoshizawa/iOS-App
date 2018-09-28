//
//  ViewController.swift
//  Cards
//
//  Created by yoshizawarei on 2018/09/27.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet var cardButtons: [UIButton]!
    var emojis: [String] = ["🤓", "🤪", "😋", "🤓", "🤪", "😋"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        // update flipCountLabel
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojis[cardNumber], on: sender)
        } else {
            print("card was not in the cardButtons collection")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.5638342525, green: 1, blue: 0.8213953225, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

