//
//  ViewController.swift
//  UISplitViewControllerTest
//
//  Created by chuck on 15/11/30.
//  Copyright © 2015年 chuck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var showIndex:Int = 1
    
    
    @IBOutlet weak var showImage: UIImageView!
    
    let images = [UIImage(named: "1.JPG") , UIImage(named: "2.JPG") , UIImage(named: "3.JPG") ,
        UIImage(named: "4.JPG")]

    override func viewDidLoad() {
        super.viewDidLoad()
        showImage.image = images[showIndex % 4]
        
        if splitViewController?.respondsToSelector("displayModeButtonItem") == true{
            navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
            navigationItem.leftItemsSupplementBackButton = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

