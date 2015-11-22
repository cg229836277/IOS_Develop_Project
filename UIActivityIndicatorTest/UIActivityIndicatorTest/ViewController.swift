//
//  ViewController.swift
//  UIActivityIndicatorTest
//
//  Created by chuck chan on 15/11/22.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func chuckBtn(sender: UIButton) {
        let firstItem = "this is chuck chan's UIActivityIndicator"
        let urlString = "http://www.dvdowns.com"
        let secondActivityItem = NSURL(string: urlString)!
        let activityIndicator = UIActivityViewController(activityItems: [firstItem , secondActivityItem], applicationActivities: nil)
        activityIndicator.excludedActivityTypes = [
            UIActivityTypePostToWeibo,
            UIActivityTypePrint,
            UIActivityTypeAssignToContact,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList,
            UIActivityTypePostToFlickr,
            UIActivityTypePostToVimeo,
            UIActivityTypePostToTencentWeibo
        ]
        self.presentViewController(activityIndicator, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

