//
//  ViewController.swift
//  Assignment4
//
//  Created by yoshizawarei on 2018/10/01.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let navButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: Selector??)
        self.navigationItem.rightBarButtonItem = navButton
    }

    func tapButton() {
        print("You tap it!")
    }

}

