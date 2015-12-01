//
//  SplitViewController.swift
//  UISplitViewControllerTest
//
//  Created by chuck on 15/11/30.
//  Copyright © 2015年 chuck. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        splitViewController?.preferredDisplayMode = .PrimaryOverlay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
