//
//  ViewController.swift
//  UIImageViewTest
//
//  Created by chuck chan on 15/11/12.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageArray:[UIImage] = [UIImage(named: "1.JPG")! , UIImage(named: "2.JPG")!, UIImage(named: "3.JPG")!, UIImage(named: "4.JPG")!]
        
 //       testImageView.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
  //              testImageView.transform = CGAffineTransformMakeRotation(90)
        
        testImageView.animationImages = imageArray
        testImageView.animationDuration = NSTimeInterval(imageArray.count)
        testImageView.animationRepeatCount = 0
        testImageView.startAnimating()
        testImageView.userInteractionEnabled = true
        let uiRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "imageViewClicked:")
        testImageView.addGestureRecognizer(uiRecognizer)
        testImageView
        .alpha = 0.5
        //testImageView.highlighted
        //testImageView.image
        //testImageView.sizeToFit()
    }
    
    @IBAction
    func imageViewClicked(sender:UIImageView){
        print("imageView was clicked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

