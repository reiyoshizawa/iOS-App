//
//  MatchingCardGame.swift
//  Cards
//
//  Created by yoshizawarei on 2018/09/28.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import Foundation

class MatchingCardGame {
    var cards = [Card]()
    var indexOfOneAndOnlyCardFaceUp: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyCardFaceUp, matchIndex != index {
           
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                indexOfOneAndOnlyCardFaceUp = nil
                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 cards are face up
                for faceDown in cards.indices {
                    cards[faceDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        // make numberOfPairsOfCards cards
        // and put them into array
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // Shuffle
        cards.shuffle()
        
    }
}

extension Array {
    mutating func shuffle() {
        for _ in 0..<self.count {
            sort { (_, _) in arc4random() < arc4random() }
        }
    }
}
