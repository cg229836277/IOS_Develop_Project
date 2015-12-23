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
        controller.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        controller.delegate = self
        controller.allowsEditing = true
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Fade)
        self.presentViewController(controller, animated: true) { () -> Void in
            print("start show choose image view")
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        picker.dismissViewControllerAnimated(true, completion: nil)
//        if info.count != 0{
//            for (index , value) in info{
//                print("path is \(index)")
//                if value is UIImage{
//                    setChooseImage.image = value as! UIImage
//                }
//            }
//        }
        var imageSource = info[UIImagePickerControllerOriginalImage] as? UIImage
        let pool:NSThread = NSThread(target: self, selector: "dealWithImage:", object: imageSource)
        pool.start()
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        print("choose image view cancel")
    }
    
    func dealWithImage(image:UIImage){
        print("start deal pictures")
        let size = CGSize(width: 320, height: 480)
        UIGraphicsBeginImageContext(size)
        image.drawInRect(CGRectMake(0, 0,size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setChooseImage.image = newImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

