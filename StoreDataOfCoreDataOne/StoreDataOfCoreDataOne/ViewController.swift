//
//  ViewController.swift
//  StoreDataOfCoreDataOne
//
//  Created by chuck chan on 16/1/23.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var myDeledate = UIApplication.sharedApplication().delegate as! AppDelegate
    var context:NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = myDeledate.managedObjectContext
        
        var schoolRequest = NSFetchRequest(entityName: "School")
        schoolRequest.fetchBatchSize = 10 //分块查询
        schoolRequest.fetchLimit = 10
        var predicaet = NSPredicate(format: "name = %@" , "Yangtze University")
        schoolRequest.predicate = predicaet
        var schoolObject = try! context!.executeFetchRequest(schoolRequest) as! [NSManagedObject]
        
        var studentRequest = NSFetchRequest(entityName: "Student")
        var studentObject = try! context!.executeFetchRequest(studentRequest) as! [NSManagedObject]
        
        for objectOfSchool in schoolObject{
            var name = objectOfSchool.valueForKey("name")
            var address = objectOfSchool.valueForKey("address")
            print("school name is \(name!)");
            print("school address is \(address!)")
        }
        
        for objectOfStudent in studentObject{
            var name = objectOfStudent.valueForKey("name")
            var number = objectOfStudent.valueForKey("number")
            var sex = objectOfStudent.valueForKey("sex")
            var year = objectOfStudent.valueForKey("year")
            print("student name is \(name)");
            print("student number is \(number)")
            print("student sex is \(sex)");
            print("student year is \(year)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

