//
//  ViewController.swift
//  NSOperationTest
//
//  Created by chuck chan on 16/3/10.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var queue:NSOperationQueue = NSOperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        operationMethod2()
    }
    
    func operationMethod1(){
        var operation:NSBlockOperation = NSBlockOperation(block: { () -> Void in
            self.downloadImage()
            return
        })
        queue.addOperation(operation)
    }
    
    func operationMethod2(){
        var operation = MyNSOperation()
        var operationCompleteBlock:(() -> Void)?
        operation.completionBlock = operationCompleteBlock
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1000), dispatch_get_main_queue()) { () -> Void in
            print("download image is over")
        }
        queue.maxConcurrentOperationCount = 3
        queue.addOperation(operation)
        //queue.cancelAllOperations()
    }
    
    func downloadImage(){
        startDownloadImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    class MyNSOperation:NSOperation{
        override func main() {
            ViewController().startDownloadImage()
        }
    }
    
    func startDownloadImage(){
        var imageUrl = "http://hangge.com/blog/images/logo.png"
        var data = try! NSData(contentsOfURL: NSURL(string: imageUrl)!, options: NSDataReadingOptions.DataReadingUncached)
        print("data length is \(data.length)")
    }

}

