//
//  ViewController.swift
//  UINavigationControllerTest
//
//  Created by chuck chan on 15/11/24.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chuck"{
            let destViewController = (segue.destinationViewController) as! ViewController2
            destViewController.value = "chan"
        }
    }
    
    @IBAction func backToPre(segue:UIStoryboardSegue){
        
    }


}

