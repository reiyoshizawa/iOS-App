//
//  TodoItem.swift
//  TodoItem
//
//  Created by yoshizawarei on 2018/10/11.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import Foundation

class TodoItem {
    
    var text = ""
    var checked = false
    
    func toggleCheckmark() {
        self.checked = !self.checked
    }
    
}
