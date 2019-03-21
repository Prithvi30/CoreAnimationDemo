//
//  SeconViewController.swift
//  WonUpItTest
//
//  Created by Prithvi Raj on 06/03/19.
//  Copyright © 2019 Prithvi Raj. All rights reserved.
//

import UIKit

var logoImages = [UIImage]()


class SeconViewController: UIViewController {

    @IBOutlet weak var roundedButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cellLabelSelected: UILabel!
    
    
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    
        logoImages.append(UIImage(named: "image.png")!)

       // thumbImg = UIImage(named: "\(self.pokemon.pokedexId)")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func WhiteBtnTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let HomeVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(HomeVC, animated: true)
//        let Nav = UINavigationController(rootViewController: HomeVC)
//        self.present(Nav, animated: true, completion: nil)
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


extension SeconViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTableViewCell
        
        cell.cellImage.image = #imageLiteral(resourceName: "image")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellLabelSelected.text = "Card Number \(indexPath.row) Selected "
        print(" selected \(indexPath.row)")
        
//        let cell = tableView.cellForRow(at: indexPath) as! SecondTableViewCell
//        let currentFilter = CIFilter(name: "CIPhotoEffectNoir")
//        currentFilter!.setValue(CIImage(image: cell.cellImage.image!), forKey: kCIInputImageKey)
//        let output = currentFilter!.outputImage
//        let cgimg = context.createCGImage(output!,from: output!.extent)
//        let processedImage = UIImage(cgImage: cgimg!)
//        cell.cellImage.image = processedImage
        
        

        let image : UIImage = UIImage(named: "\(logoImages)")!
        let noirImage = image.noir // noirImage is an optional UIImage (UIImage?)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTableViewCell
        
        cell.cellImage.image = noirImage
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


extension UIImage {
    var noir: UIImage? {
        let context = CIContext(options: nil)
        guard let currentFilter = CIFilter(name: "CIPhotoEffectNoir") else { return nil }
        currentFilter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        if let output = currentFilter.outputImage,
            let cgImage = context.createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        }
        return nil
    }
}
