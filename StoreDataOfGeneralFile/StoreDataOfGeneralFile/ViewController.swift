//
//  ViewController.swift
//  StoreDataOfGeneralFile
//
//  Created by chuck chan on 16/1/13.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ShowDataTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func storeDataClicked(sender: UIButton) {
        setData()
    }
    
    
    @IBAction func getDataClicked(sender: UIButton) {
        loadData()
    }
    
    
    func loadData(){
        print("start load data")
        var filePath = getFilePath(fileName: "chuck.txt")
        if NSFileManager.defaultManager().fileExistsAtPath(filePath){
            print("file exist \(filePath)")
            var text = try! NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
            ShowDataTextFiled.text = text as String
        }
    }
    
    func setData(){
        print("start store data")
        if let text:NSString = ShowDataTextFiled.text{
            try! text.writeToFile(getFilePath(fileName: "chuck.txt"), atomically: true, encoding: NSUTF8StringEncoding)
        }
    }
    
    func getFilePath(fileName fileName : String)->String{
        var path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        print("storePath = \(path[0])")
        var documentFactory = path[0].stringByAppendingString("/" + fileName) as! String
        print("fileStorePath = \(documentFactory)")
        return documentFactory;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

