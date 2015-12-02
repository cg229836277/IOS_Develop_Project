//
//  ViewController.swift
//  UIAutoResizeTest
//
//  Created by chuck chan on 15/12/1.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cyanLabel: UILabel!
    
    @IBOutlet weak var purpleLabel: UILabel!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        super.willRotateToInterfaceOrientation(toInterfaceOrientation, duration: duration)
        if toInterfaceOrientation == UIInterfaceOrientation.LandscapeRight || toInterfaceOrientation == UIInterfaceOrientation.LandscapeLeft{
            self.view.backgroundColor = UIColor.cyanColor()
            cyanLabel.text = "现在是横屏"
            
        }else{
            cyanLabel.text = "现在是竖屏"
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

