//
//  ViewController.swift
//  UIAlterViewTest
//
//  Created by chuck chan on 15/11/16.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIAlertViewDelegate{
    var alertView: UIAlertView!;
    var buttonsView: UIAlertView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView = UIAlertView(title: "警告", message: "是否删除？", delegate: self, cancelButtonTitle: "确认")
        
        
        buttonsView = UIAlertView(title: "Message", message: "Commit your Operation", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Ok", "Update" , "Retry")
    }

    @IBAction func showAlertView(sender: AnyObject) {
        if !alertView.visible{
            alertView.show()
        }
    }
    
    @IBAction func showButtonsView(sender: AnyObject) {
        if !buttonsView.visible{
            buttonsView.show()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

