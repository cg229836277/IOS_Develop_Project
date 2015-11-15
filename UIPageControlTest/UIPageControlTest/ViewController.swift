//
//  ViewController.swift
//  UIPageControlTest
//
//  Created by chuck chan on 15/11/15.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showCurrentValueView: UILabel!
    @IBOutlet weak var uipageControlTest: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        uipageControlTest.addTarget(self, action: "pageIndexChanged:", forControlEvents:UIControlEvents.TouchUpInside)
        showCurrentValueView.text = "this is first page"
    }
    
    @IBAction
    func pageIndexChanged(sender: UIPageControl){
        switch sender.currentPage{
        case 0:
            showCurrentValueView.text = "this is first page"
        case 1:
            showCurrentValueView.text = "this is second page"
        case 2:
            showCurrentValueView.text = "this is third page"
        default:
            showCurrentValueView.text = "this is first page"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

