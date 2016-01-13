//
//  ViewController.swift
//  StoreDataOfSettingBundleTest
//
//  Created by chuck chan on 16/1/8.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showSettingText: UITextField!
    
    var myUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    @IBAction func saveSettingBtnClicked(sender: UIButton) {
        setToggleState()
    }
    
    @IBAction func getSettingBtnClicked(sender: UIButton) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettingBundleData()
        loadSettingData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadSettingBundleData(){
        //setting Bundle
        var settingBundle : NSString = NSBundle.mainBundle().pathForResource("Settings", ofType: "bundle")!
        
        //Root
        var root = NSDictionary(contentsOfFile: settingBundle.stringByAppendingPathComponent("Root.plist"))
        //字典中获取值
        var prefrences = root?.objectForKey("PreferenceSpecifiers")  as! Array<NSDictionary>
        
        var registerData:Dictionary<String , AnyObject> = [:]
        
        for preference in prefrences{
            if let key = preference.objectForKey("Key") as? String{
                print("key = \(key)")
                registerData[key] = preference.objectForKey("DefaultValue")
            }
        }
        if registerData.count > 0{
            myUserDefaults.registerDefaults(registerData)
            myUserDefaults.synchronize()
        }
    }
    
    func loadSettingData(){
        var settingData = myUserDefaults.objectForKey("name_preference") as! String
        showSettingText.text = settingData
    }
    
    func setToggleState(){
        myUserDefaults.setObject(false, forKey: "enabled_preference")
    }
}

