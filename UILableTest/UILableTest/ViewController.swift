//
//  ViewController.swift
//  UILableTest
//
//  Created by chuck chan on 15/11/1.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var GiveFlowerBtn: UIButton!
    @IBOutlet weak var showColorLabel: UILabel!
    
    @IBOutlet weak var selectColorView:UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showColorLabel.backgroundColor = UIColor.redColor()
        
        selectColorView.addTarget(self, action: "selection:", forControlEvents: .ValueChanged)
    }

    @IBAction func giveMeFlower(sender: UIButton) {
        
    }
    
    @IBAction func selection(sender: UISegmentedControl){
        let index = sender.selectedSegmentIndex
        switch index{
        case 0:
            showColorLabel.backgroundColor = UIColor.redColor()
        case 1:
            showColorLabel.backgroundColor = UIColor.yellowColor()
        case 2:
            showColorLabel.backgroundColor = UIColor.greenColor()
        case 3:
            showColorLabel.backgroundColor = UIColor.purpleColor()
        default:
            showColorLabel.backgroundColor = UIColor.whiteColor()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

