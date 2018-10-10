//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by yoshizawarei on 2018/10/09.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var studentName: UILabel! {
        didSet {
            studentName.text = nameString
        }
    }
    @IBOutlet weak var position: UILabel! {
        didSet {
            position.text = positionString
        }
    }
    @IBOutlet weak var biography: UITextView!

    var nameString: String!
    var positionString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
