//
//  ViewController2.swift
//  UINavigationControllerTest
//
//  Created by chuck chan on 15/11/24.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var destButton: UIButton!
    var value:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destButton.setTitle(value, forState: UIControlState.Normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
