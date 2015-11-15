//
//  ViewController.swift
//  UITextView2
//
//  Created by chuck chan on 15/11/11.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var chuckBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func receiveAction(sender: UIButton) {
        self.resignFirstResponder();
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

