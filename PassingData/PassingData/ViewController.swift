//
//  ViewController.swift
//  PassingData
//
//  Created by yoshizawarei on 2018/10/04.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "first" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.data = nameTextField.text
            }
        }
    }

}

