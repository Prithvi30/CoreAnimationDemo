//
//  FilpableCell.swift
//  WonUpItTest
//
//  Created by Prithvi Raj on 06/03/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit

let label = UILabel(frame: CGRect(x: 20.0, y: 20.0, width: 250.0, height: 50.0))


class FilpableCell: UITableViewCell {

    @IBOutlet weak var BgImage: UIImageView!
    @IBOutlet weak var CellLbl: UILabel!
    @IBOutlet weak var FlipBtn: UIButton!
    var isOpen = true
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         CellLbl.layer.cornerRadius = 5
        CellLbl.clipsToBounds = true

        FlipBtn.layer.cornerRadius = 25
        BgImage.layer.cornerRadius = 10
        BgImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func FlipBtnTapped(_ sender: UIButton) {
        print("Tapped")
        
        if isOpen {
            isOpen = false
            BgImage.image = #imageLiteral(resourceName: "back")
            UIView.transition(with: BgImage,
                              duration: 0.5,
                              options: .transitionFlipFromLeft,
                              animations: nil,
                              completion: nil)
            label.textAlignment = .left
            label.textColor = .white
            label.font = UIFont(name: "Avenir-Light", size: 20.0)
            label.text = "This is back Side"
            self.BgImage.addSubview(label)
            CellLbl.isHidden = true
            label.isHidden = false
            
        } else {
            isOpen = true
            label.isHidden = true
            BgImage.image = #imageLiteral(resourceName: "tablebg")
            UIView.transition(with: BgImage,
                              duration: 0.5,
                              options: .transitionFlipFromLeft,
                              animations: nil,
                              completion: nil)
            CellLbl.isHidden = false
            
        }
       
    }
    

}
