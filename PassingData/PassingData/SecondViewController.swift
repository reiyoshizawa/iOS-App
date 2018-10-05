//
//  SecondViewController.swift
//  PassingData
//
//  Created by yoshizawarei on 2018/10/04.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = data
    }

}
