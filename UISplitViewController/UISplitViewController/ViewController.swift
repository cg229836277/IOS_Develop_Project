//
//  ViewController.swift
//  UISplitViewController
//
//  Created by chuck chan on 15/11/29.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var images:[UIImage]?
    var selectedIndex = 0

    @IBOutlet weak var showSelectedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [UIImage(named: "1.JPG")! , UIImage(named: "2.JPG")!,UIImage(named: "3.JPG")!,UIImage(named: "4.JPG")!]
        setSelectedImage(selectedIndex)
        
        if splitViewController?.respondsToSelector("displayModeButtonItem") == true {
            navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
            navigationItem.leftItemsSupplementBackButton = true
        }

    }
    
    func setSelectedImage(selectedImage : Int){
        if selectedImage < images?.count{
            print("selected \(selectedIndex)")
            showSelectedImage.image = images![selectedIndex]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

