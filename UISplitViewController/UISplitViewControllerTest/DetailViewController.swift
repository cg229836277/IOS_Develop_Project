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

    @IBOutlet weak var showDetailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetailLabel.text = "\(showIndex)"
        
        if splitViewController?.respondsToSelector("displayModeButtonItem") == true{
            navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
            navigationItem.leftItemsSupplementBackButton = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

