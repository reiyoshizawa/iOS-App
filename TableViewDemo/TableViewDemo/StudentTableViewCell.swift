//
//  StudentTableViewCell.swift
//  TableViewDemo
//
//  Created by yoshizawarei on 2018/10/09.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var position: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
