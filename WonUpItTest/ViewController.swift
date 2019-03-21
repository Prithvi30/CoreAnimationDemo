//
//  ViewController.swift
//  WonUpItTest
//
//  Created by Prithvi Raj on 06/03/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }


}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilpableCell", for: indexPath) as! FilpableCell
        
        cell.selectionStyle = .none
        
        UIView.transition(with: cell,
            duration: 0.5,
            options: .transitionFlipFromLeft,
            animations: nil,
            completion: nil)
        
        
        
        cell.CellLbl.text = "First name"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell Tapped")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SecondVC = storyboard.instantiateViewController(withIdentifier: "SeconViewController") as! SeconViewController
        self.navigationController?.pushViewController(SecondVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
    
    
}
