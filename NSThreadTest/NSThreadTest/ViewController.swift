//
//  ViewController.swift
//  NSThreadTest
//
//  Created by chuck chan on 16/3/10.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var thread1:NSThread?
    var thread2:NSThread?
    
    var condition1:NSCondition = NSCondition()
    var condition2:NSCondition = NSCondition()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //第一种方法
        //NSThread.detachNewThreadSelector("downloadImage", toTarget: self, withObject: nil)
        //第二种方法
        //var thread1 = NSThread(target: self, selector: "downloadImage", object: nil)
        //thread1.start()
        
        startTwoThread()
    }
    
    func startTwoThread(){
        thread1 = NSThread(target: self, selector: "method1:", object: nil)
        thread2 = NSThread(target: self, selector: "method2:", object: nil)

        thread1?.start()
    }
    
    func downloadImage(){
        var imageUrl = "http://hangge.com/blog/images/logo.png"
        var data = try! NSData(contentsOfURL: NSURL(string: imageUrl)!, options: NSDataReadingOptions.DataReadingUncached)
        print("data is \(data.length)")
    }
    
    func method1(sender:AnyObject){
        for i in 1...10{
            print("i is \(i) in thread1")
            sleep(1)
            if i == 3{
                thread2?.start()
                
                condition1.lock()
                condition1.wait()
                condition1.unlock()
            }
        }
        print("thread1 is over")
        condition2.signal()
    }
    
    func method2(sender:AnyObject){
        for j in 1...10{
            print("j is \(j) in thread2")
            sleep(1)
            if j == 3{
                condition1.signal()
                
                condition2.lock()
                condition2.wait()
                condition2.unlock()
            }
        }
        print("thread2 is over")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

