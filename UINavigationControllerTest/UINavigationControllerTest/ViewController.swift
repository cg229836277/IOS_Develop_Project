//
//  ViewController.swift
//  UINavigationControllerTest
//
//  Created by chuck chan on 15/11/24.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit



class ViewController: UIViewController , ValueTransferDeletgate{
    
    var delegate:ValueTransferDeletgate?
    @IBOutlet weak var firstButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chuck"{
            let destViewController = (segue.destinationViewController) as! ViewController2
            destViewController.value = "chan"
            destViewController.delegate = self
        }
    }
    
    func transferData(value: String) {
        firstButton.setTitle(value, forState: UIControlState.Normal )
    }
    
    @IBAction func backToPre(segue:UIStoryboardSegue){
        
    }


}

