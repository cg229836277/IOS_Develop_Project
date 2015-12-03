//
//  ViewController.swift
//  UIAnimationTest
//
//  Created by chuck chan on 15/12/3.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var excuteAnimationView: UIView!
    var originFrame:CGRect!
    
    override func viewDidLoad() {
        originFrame = excuteAnimationView.frame
    }
    @IBAction func showAnimationClicked(sender: UIButton) {
        //moveToAPlace()
        moveToPlaceWithOptions()
    }
    
    func  backToOrigin(){
        excuteAnimationView.frame = originFrame
    }
    
    func moveToAPlace(){
        UIView.animateWithDuration(4) { () -> Void in
            self.excuteAnimationView.frame.origin.x += 200
        }
    }
    
    func moveToPlaceWithOptions(){
        UIView.animateWithDuration(3, delay: 0, options:UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.excuteAnimationView.frame.origin.x += 200
            }) { (chuck) -> Void in
                self.excuteAnimationView.frame = self.originFrame
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

