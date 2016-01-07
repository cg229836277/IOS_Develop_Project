//
//  ViewController.swift
//  StoreDataOfSandBoxTest
//
//  Created by chuck chan on 16/1/7.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var inputDataTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //第一个是查找的路径，第二个是查找的范围 ， 第三个是是否扩展～（linux）
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var documentDirectory = paths[0] as String
        print(documentDirectory)
        
        var pathManagerPath = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        print(pathManagerPath)
        
        var tempDirectoryPath = NSTemporaryDirectory()
        print(tempDirectoryPath)
        
    }
    
    @IBAction func saveDataBtn(sender: UIButton) {
        var text = inputDataTextField.text
        if text != nil{
            userDefaults.setObject(text, forKey: "chuck")
            userDefaults.synchronize()
        }
    }
    
    @IBAction func readDataBtn(sender: UIButton) {
        var savedData = userDefaults.stringForKey("chuck")
        if savedData != nil{
            inputDataTextField.text = savedData
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

