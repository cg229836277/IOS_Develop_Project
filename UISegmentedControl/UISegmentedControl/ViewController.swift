//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by chuck chan on 15/11/15.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func segmentedControlValueChanged(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index{
        case 0:
            self.view.backgroundColor = UIColor.greenColor()
        case 1:
            self.view.backgroundColor = UIColor.redColor()
        case 2:
            self.view.backgroundColor = UIColor.blueColor()
        default:
            self.view.backgroundColor = UIColor.whiteColor()
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

