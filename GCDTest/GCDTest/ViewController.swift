//
//  ViewController.swift
//  GCDTest
//
//  Created by chuck chan on 16/3/11.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        singnalQueue()
    }
    
    func createDifferentQueue(){
        //
        var serial = dispatch_queue_create("serialQueue" , DISPATCH_QUEUE_SERIAL)
        //
        var concurrent = dispatch_queue_create("concurrentQueue" , DISPATCH_QUEUE_CONCURRENT)
    }
    
    func getGlobalQueueWithPrioraty(){
        var globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    }
    
    func getMainQueue(){
        var mainQueue = dispatch_get_main_queue()
    }
    
    func addTaskToQueue(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            print("do some work")
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                print("here can update ui")
            })
        }
        
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            print("do some work")
        }
        
        print("sync work end")
        
        dispatch_sync(dispatch_get_main_queue(), { () -> Void in
            print("after sync can update ui")
        })
    }
    
    func startOrStopQueue(){
        var queue = dispatch_queue_create("chuckchan", DISPATCH_QUEUE_SERIAL)
        dispatch_suspend(queue)
        dispatch_resume(queue)
    }
    
    func execOnce(){
        var predicate:dispatch_once_t = 0
        dispatch_once(&predicate) { () -> Void in
            print("this function will run once")
        }
    }
    
    func delayRun(){
        var delta = 2.0 * Double(NSEC_PER_SEC)
        var delayTime = dispatch_time(DISPATCH_TIME_NOW , Int64(delta))
        dispatch_after(delayTime,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            print("this is delay 2 seconds to run")
        }
    }
    
    func groupQueue(){
        var queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        var group = dispatch_group_create()
        
        dispatch_group_async(group, queue) { () -> Void in
            print("one")
        }
        dispatch_group_async(group, queue) { () -> Void in
            print("two")
        }
        dispatch_group_async(group, queue) { () -> Void in
            print("three")
        }
        
        dispatch_group_notify(group, dispatch_get_main_queue()) { () -> Void in
            print("all task is over")
        }
        
        var result = dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        if result == 0{
            print("task is over")
        }else{
            print("some tasks is not over")
        }
    }
    
    func dispatchApply(){
        var queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(queue) { () -> Void in
            dispatch_apply(7, queue, { (index) -> Void in
                print("it is \(index) times")
            })
        }
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            print("it is over")
        }
    }
    
    func singnalQueue(){
        var queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        var singal = dispatch_semaphore_create(1)
        
        for i in 0..<10{
            dispatch_async(queue, { () -> Void in
                print("i is \(i)")
            })
        }
        
        for j in 1...9{
            dispatch_async(queue, { () -> Void in
                dispatch_semaphore_wait(singal, DISPATCH_TIME_FOREVER)
                print("j is \(j)")
                dispatch_semaphore_signal(singal)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

