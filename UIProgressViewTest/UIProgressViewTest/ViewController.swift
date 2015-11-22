//
//  ViewController.swift
//  UIProgressViewTest
//
//  Created by chuck chan on 15/11/22.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var showProgress: UIProgressView!
    var control = UIControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addProgressAuto()
        //control.sendAction(Selector("addProgressAuto"), to: self, forEvent: nil)
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("addProgressAuto"), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //addProgressAuto()
    }
    
    override func viewDidDisappear(animated: Bool) {
        showProgress.hidden = true
    }
    
    func addProgressAuto(){
        if showProgress.hidden || 1.0 <= showProgress.progress{
            showProgress.progress = 0
        }
        
        showProgress.progress += 0.1
        
        //control.sendAction(Selector("addProgressAuto"), to: self, forEvent: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

