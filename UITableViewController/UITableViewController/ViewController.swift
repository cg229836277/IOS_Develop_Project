//
//  ViewController.swift
//  UITableViewController
//
//  Created by chuck chan on 15/11/25.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UITabBarController ,UITabBarControllerDelegate{
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //let currentController = self.tabBarController
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if tabBarController.selectedIndex == 1{
            count++
            let controller = viewController as! ViewController2
            controller.changeTakePhotoValue.text = "这是第\(count)次"
        }
    }
}

