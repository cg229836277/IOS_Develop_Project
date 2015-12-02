//
//  ViewController.swift
//  UIDrawLineTest
//
//  Created by chuck chan on 15/12/2.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = DrawView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        if let customView = self.view as? DrawView{
            print("当前视图是drawview")
            customView.printInvokePath("当前视图是drawview")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

