//
//  ViewController.swift
//  TableViewDemo2nd
//
//  Created by yoshizawarei on 2018/10/10.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class ContactViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = "iOS Programming!"
        }
        
        return cell
        
    }

    

}

