//
//  ViewController.swift
//  UIStepperTest
//
//  Created by chuck chan on 15/11/12.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showStepperView: UILabel!
    @IBOutlet weak var uistepperView: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        uistepperView.addTarget(self, action: "showStepperValue:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBAction
    func showStepperValue(sender: UIStepper){
        showStepperView.text = String(sender.value);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

