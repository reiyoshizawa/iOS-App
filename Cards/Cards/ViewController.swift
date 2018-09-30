//
//  ViewController.swift
//  Cards
//
//  Created by yoshizawarei on 2018/09/27.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = MatchingCardGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        // update flipCountLabel
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            // update the View
            updateUIFromModel()
//            flipCard(withEmoji: emojis[cardNumber], on: sender)
        } else {
            print("card was not in the cardButtons collection")
        }
    }
    
    func updateUIFromModel() {
        for i in cardButtons.indices {
            let button = cardButtons[i] // view
            let card = game.cards[i] // model
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.5638342525, green: 1, blue: 0.8213953225, alpha: 1)
            }
        }
    }
    
    var emojis: [String] = ["🤓", "🤪", "😋", "🤣", "🤩", "🤯"]
    var emojiMap = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emojiMap[card.identifier] == nil, emojis.count > 0 {
            // set the emoji for the identifier
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            emojiMap[card.identifier] = emojis.remove(at: randomIndex)
        }
        return emojiMap[card.identifier] ?? "?"
    }
    
//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: .normal)
//            button.backgroundColor = #colorLiteral(red: 0.5638342525, green: 1, blue: 0.8213953225, alpha: 1)
//        } else {
//            button.setTitle(emoji, for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//    }
}

