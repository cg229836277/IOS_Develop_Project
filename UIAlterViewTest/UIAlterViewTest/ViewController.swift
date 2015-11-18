//
//  ViewController.swift
//  UIAlterViewTest
//
//  Created by chuck chan on 15/11/16.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIAlertViewDelegate{
    //var alertView: UIAlertView!;
    //var buttonsView: UIAlertView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*alertView = UIAlertView(title: "警告", message: "是否删除？", delegate: self, cancelButtonTitle: "确认")
        
        
        buttonsView = UIAlertView(title: "Message", message: "Commit your Operation", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Ok", "Update" , "Retry")*/
    }

    @IBAction func showAlertView(sender: AnyObject) {
        var alertControl = UIAlertController(title: "Message", message: "Operation is not support", preferredStyle: UIAlertControllerStyle.Alert)
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel){(action:UIAlertAction!) -> Void in
            print("cancel button is Clicked")
        }
        var okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){(action:UIAlertAction!) -> Void in //此处使用trailing闭包
            print("ok button is Clicked")
        }
        alertControl.addAction(cancelAction)
        alertControl.addAction(okAction)
        self.presentViewController(alertControl, animated: true, completion: showAlertView) //此处函数作为参数 现实对话框
    }
    //对话框弹出的时候调用这个函数
    func showAlertView(){
        print("alertView is Showing")
    }
    
    @IBAction func showButtonsView(sender: AnyObject) {
        var loginAlert = UIAlertController(title: "登陆对话框", message: "请输入账号和密码", preferredStyle: UIAlertControllerStyle.Alert)
        loginAlert.addTextFieldWithConfigurationHandler{(textField: UITextField) -> Void in
            textField.placeholder = "input your number"
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "userNameTextFiledChanged:", name: UITextFieldTextDidChangeNotification, object: textField)
        }
        loginAlert.addTextFieldWithConfigurationHandler{(loginTextField:UITextField)-> Void in
            loginTextField.placeholder = "input passworld"
            loginTextField.secureTextEntry = true
        }
        
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel){(action:UIAlertAction) -> Void in
            print("cancel login")
            NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextFieldTextDidChangeNotification, object: nil)
        }
        
        var okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){(action:UIAlertAction)-> Void in
            print("start login")
            NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextFieldTextDidChangeNotification, object: nil)
        }
        loginAlert.addAction(cancelAction)
        loginAlert.addAction(okAction)
        self.presentViewController(loginAlert, animated: true, completion: showAlertView)
    }
    
    @IBAction
    func userNameTextFiledChanged(sender: UITextField){
        print("is inputting now")
    }
    
    @IBAction func showActionSheet(sender: UIButton) {
        let actionSheetView: UIAlertController = UIAlertController(title: "Warning", message: "confirm the Operation", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)//can add listenner
        actionSheetView.addAction(cancelAction)
        self.presentViewController(actionSheetView, animated: true, completion: nil)//can add listenner when showing
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

