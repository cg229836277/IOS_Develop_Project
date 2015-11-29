//
//  SplitParentView.swift
//  UISplitViewController
//
//  Created by chuck chan on 15/11/29.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class SplitParentView: UISplitViewController , UISplitViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredDisplayMode = .PrimaryOverlay
    }
}
