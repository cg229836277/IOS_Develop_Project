//
//  ViewController.swift
//  UIDatePickerTest
//
//  Created by chuck chan on 15/11/19.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dateFormater = NSDateFormatter()
    
    @IBAction func dateSelected(sender: UIDatePicker) {
        let date: String = dateFormater.stringFromDate(sender.date)
        print("choose date is " + date)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormater.timeStyle = NSDateFormatterStyle.NoStyle
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

