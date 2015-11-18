//
//  ViewController.swift
//  UIPickerViewTest
//
//  Created by chuck chan on 15/11/17.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var myDataPickerView: UIPickerView!
    
    var month = [""]
    var week = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        month = ["一月" , "二月" , "三月" , "四月" , "五月" , "六月" , "七月"]
        week = ["周一" , "周二" , "周三" , "周四" , "周五" ,"周六" , "周天"]
        
        myDataPickerView.dataSource = self
        myDataPickerView.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return  2;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return month.count
        }
        return week.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return month[row]
        }
        return week[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            myDataPickerView.selectRow(0, inComponent: 1, animated: true)
            print("month \(row) selected")
        }else{
            print("week \(row) selected")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

