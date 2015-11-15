//
//  ViewController.swift
//  UIScrollViewTest
//
//  Created by chuck chan on 15/11/15.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiScrollView.contentSize = CGSizeMake(240 * 4, 240)
        
        let imag1: UIImage = UIImage(named: "1.JPG")!
        let imag2: UIImage = UIImage(named: "2.JPG")!
        let imag3: UIImage = UIImage(named: "3.JPG")!
        let imag4: UIImage = UIImage(named: "4.JPG")!
        
        let imageView1: UIImageView = UIImageView(image: imag1)
        imageView1.frame = CGRectMake(0, 0, 240, 240)
        let imageView2: UIImageView = UIImageView(image: imag2)
        imageView2.frame = CGRectMake(240, 0, 240, 240)
        let imageView3: UIImageView = UIImageView(image: imag3)
        imageView3.frame = CGRectMake(480, 0, 240, 240)
        let imageView4: UIImageView = UIImageView(image: imag4)
        imageView4.frame = CGRectMake(720, 0, 240, 240)
        
        uiScrollView.addSubview(imageView1)
        uiScrollView.addSubview(imageView2)
        uiScrollView.addSubview(imageView3)
        uiScrollView.addSubview(imageView4)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

