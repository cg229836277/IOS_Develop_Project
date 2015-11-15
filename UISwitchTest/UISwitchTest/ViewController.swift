//
//  ViewController.swift
//  UISwitchTest
//
//  Created by chuck chan on 15/11/15.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var checkPasswdTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        checkPasswdTextField.secureTextEntry = falsesss
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func switchChanged(sender: UISwitch) {
        if sender.on {
            self.view.backgroundColor = UIColor.blueColor()
            checkPasswdTextField.secureTextEntry = true
        }else{
            self.view.backgroundColor = UIColor.whiteColor()
            checkPasswdTextField.secureTextEntry = false
        }
    }
}

