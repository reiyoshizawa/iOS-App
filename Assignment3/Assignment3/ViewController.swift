//
//  ViewController.swift
//  Assignment3
//
//  Created by yoshizawarei on 2018/10/04.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let butt = UIButton(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2 - 25, width: 100, height: 50))
        butt.backgroundColor = #colorLiteral(red: 0.7553044992, green: 1, blue: 0.4450613754, alpha: 1)
        view.addSubview(butt)
        
    }


}

