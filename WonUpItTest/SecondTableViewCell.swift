//
//  SecondTableViewCell.swift
//  WonUpItTest
//
//  Created by Prithvi Raj on 06/03/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellImage.layer.cornerRadius = 10
        cellImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
