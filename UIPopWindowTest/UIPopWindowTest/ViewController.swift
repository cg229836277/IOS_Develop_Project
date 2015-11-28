//
//  ViewController.swift
//  UIPopWindowTest
//
//  Created by chuck chan on 15/11/28.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPopoverControllerDelegate {
    @IBOutlet weak var showEmailLabel: UILabel!
    
    @IBOutlet weak var startInputEmail: UIButton!
    
    var popOver:UIPopoverController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        startInputEmail.addTarget(self, action: "startInput:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    @IBAction
    func startInput(sender:UIButton){
        popOver = UIPopoverController(contentViewController: PopWindowController())
        
        //popOver.popoverContentSize = CGSize(width: 480, height: 320)
        popOver!.presentPopoverFromRect(sender.frame, inView: sender.superview!, permittedArrowDirections: UIPopoverArrowDirection.Up, animated: true)
        popOver!.delegate = self
    }
    
    func popoverControllerDidDismissPopover(popoverController: UIPopoverController) {
        print("输出邮箱地址")
        let viewController = popoverController.contentViewController as! PopWindowController
        //showEmailLabel.text = viewController.inputEmailText?.text
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

