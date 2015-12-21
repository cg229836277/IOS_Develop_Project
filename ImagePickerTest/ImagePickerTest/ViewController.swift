//
//  ViewController.swift
//  ImagePickerTest
//
//  Created by chuck chan on 15/12/21.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var setChooseImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func choosePictures(sender: UIButton) {
        let controller = UIImagePickerController()
        controller.sourceType = UIImagePickerControllerSourceType.Camera
        controller.delegate = self
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Fade)
        self.presentViewController(controller, animated: true) { () -> Void in
            print("start show choose image view")
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        if info.count != 0{
            for (index , value) in info{
                print("path is \(index)")
                if value is UIImage{
                    setChooseImage.image = value as! UIImage
                }
            }
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        print("choose image view cancel")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

