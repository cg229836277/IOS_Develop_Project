//
//  ViewController.swift
//  StoreDataOfObjectModel
//
//  Created by chuck chan on 16/1/14.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showMessageText: UITextField!
    
    @IBOutlet weak var showImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        showMessageText.text = "chuck chan"
        startEncodeData()
    }
    
    @IBAction func startLoadDataClicked(sender: UIButton) {
        startLoadData()
    }
    
    func startEncodeData(){
        var student = Student()
        student.name = showMessageText.text!
        student.image = UIImage(named: "4.JPG")
        var data = NSKeyedArchiver.archivedDataWithRootObject(student)
        data.writeToFile(getFilePath(path: "chan.txt"), atomically: true)
        
    }
    
    func startLoadData(){
        var filePath = getFilePath(path: "chan.txt")
        if NSFileManager.defaultManager().fileExistsAtPath(filePath){
            var data = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? Student
            if data != nil{
                showMessageText.text = data?.name
                showImageView.image = data?.image
            }
        }
        
    }
    
    func getFilePath(path path:String)->String{
        var documentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var filePath = documentPath[0].stringByAppendingString("/" + path) as! String
        return filePath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

