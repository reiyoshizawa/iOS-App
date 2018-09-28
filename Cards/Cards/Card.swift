//
//  Card.swift
//  Cards
//
//  Created by yoshizawarei on 2018/09/28.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    static var identifierMaker = 0
    static func getUniqueIdentifier() -> Int {
        identifierMaker += 1
        return identifierMaker
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
