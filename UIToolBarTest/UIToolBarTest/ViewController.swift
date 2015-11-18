//
//  ViewController.swift
//  UIToolBarTest
//
//  Created by chuck chan on 15/11/17.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var toolBar: UIToolbar!
    
    @IBAction func begainClicked(sender: UIBarButtonItem) {
        print("begain button Clicked")
    }
    
    @IBAction func stopButtonClicked(sender: UIBarButtonItem) {
        print("stop button Clicked")
    }
    
    @IBAction func continueButtonClicked(sender: UIBarButtonItem) {
        print("continue button Clicked")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

